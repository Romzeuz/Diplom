// src/mocks/handlers.ts
import { http, HttpResponse, delay } from 'msw';
import { mockTexts } from './texts';
import { mockAuthor } from './author';
import { mockAIExplanations } from './ai-responses';

export const handlers = [
  // Обработчик для получения списка текстов
  http.get('*/api/texts', async ({ request }) => {
    // Получаем URL-объект из запроса
    const url = new URL(request.url);

    // Получаем параметры запроса
    const search = url.searchParams.get('search') || '';
    const tags = url.searchParams.getAll('tags') || [];
    const page = parseInt(url.searchParams.get('page') || '1');
    const pageSize = parseInt(url.searchParams.get('pageSize') || '10');

    let filteredTexts = [...mockTexts];

    // Применяем фильтры поиска
    if (search) {
      const searchLower = search.toLowerCase();
      filteredTexts = filteredTexts.filter(text =>
        text.title.toLowerCase().includes(searchLower) ||
        text.content.toLowerCase().includes(searchLower)
      );
    }

    // Фильтрация по тегам
    if (tags.length > 0) {
      filteredTexts = filteredTexts.filter(text =>
        tags.some(tag => text.tags.includes(tag))
      );
    }

    // Пагинация
    const start = (page - 1) * pageSize;
    const end = start + pageSize;
    const paginatedTexts = filteredTexts.slice(start, end);

    // В MSW 2.x мы возвращаем HttpResponse напрямую
    await delay(500); // Имитация задержки сети

    return HttpResponse.json({
      data: paginatedTexts,
      meta: {
        pagination: {
          page,
          pageSize,
          pageCount: Math.ceil(filteredTexts.length / pageSize),
          total: filteredTexts.length
        }
      }
    });
  }),

  // Обработчик для получения отдельного текста
  http.get('*/api/texts/:id', async ({ params }) => {
    // Параметры пути доступны через объект params
    const id = params.id;
    const text = mockTexts.find(t => t.id === parseInt(id as string));

    if (!text) {
      return new HttpResponse(
        JSON.stringify({ error: 'Text not found' }),
        { status: 404 }
      );
    }

    await delay(300);

    return HttpResponse.json({
      data: {
        id: text.id,
        attributes: {
          title: text.title,
          content: text.content,
          author: text.author,
          coverUrl: text.coverUrl,
          tags: text.tags,
          publishedAt: text.publishedAt
        }
      }
    });
  }),

  // Обработчик для получения информации об авторе
  http.get('*/api/authors/:id', async () => {
    await delay(400);

    return HttpResponse.json({
      data: {
        id: mockAuthor.id,
        attributes: {
          name: mockAuthor.name,
          bio: mockAuthor.bio,
          timeline: mockAuthor.timeline
        }
      }
    });
  }),

  // Обработчики для AI API
  http.post('*/api/explain', async ({ request }) => {
    const data = await request.json() as {text: string};
    const text = data?.text;

    // Поиск подходящего объяснения на основе ключевых слов
    const keywords = Object.keys(mockAIExplanations);
    const matchedKeyword = keywords.find(keyword =>
      text.toLowerCase().includes(keyword.toLowerCase())
    );

    let explanation;
    if (matchedKeyword) {
      explanation = mockAIExplanations[matchedKeyword];
    } else {
      explanation = {
        explanation: "Это фрагмент текста, который требует дополнительного контекста для полного понимания.",
        links: ["Литературный анализ", "Теория литературы"]
      };
    }

    await delay(700);
    return HttpResponse.json(explanation);
  }),

  http.post('*/api/contextual-links', async () => {
    await delay(600);

    return HttpResponse.json({
      links: [
        "Теория литературы",
        "Современный литературный процесс",
        "Цифровая гуманитаристика",
        "Медиатеория"
      ]
    });
  })
];