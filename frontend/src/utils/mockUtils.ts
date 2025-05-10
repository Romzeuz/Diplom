import {Text} from '../types';

// Генерирует случайный элемент из массива
export const randomElement = <T>(array: T[]): T => {
    return array[Math.floor(Math.random() * array.length)];
};

// Генерирует случайное число в диапазоне
export const randomInt = (min: number, max: number): number => {
    return Math.floor(Math.random() * (max - min + 1)) + min;
};

// Генерирует случайный текст заданной длины
export const generateMockText = (id: number): Text => {
    const tags = ['поэзия', 'проза', 'критика', 'философия', 'современность', 'классика', 'анализ'];
    const titles = [
        'Трансформация нарратива в современной литературе',
        'Эстетика постмодернизма',
        'Диалог культур в литературном процессе',
        'Цифровая поэтика',
        'Границы текста и гипертекстуальность',
        'Метафора как когнитивный механизм',
        'Литературная критика в эпоху social media'
    ];

    // Выбираем случайные теги (от 1 до 3)
    const selectedTags: string[] = [];
    const tagCount = randomInt(1, 3);
    for (let i = 0; i < tagCount; i++) {
        const tag = randomElement(tags);
        if (!selectedTags.includes(tag)) {
            selectedTags.push(tag);
        }
    }

    // Генерируем дату публикации в диапазоне последних 5 лет
    const currentDate = new Date();
    const pastDate = new Date(
        currentDate.getFullYear() - randomInt(0, 5),
        randomInt(0, 11),
        randomInt(1, 28)
    );
    const publishedAt = pastDate.toISOString().split('T')[0];

    return {
        id,
        title: randomElement(titles),
        content: `# ${randomElement(titles)}\n\nЭто пример сгенерированного контента для тестирования приложения. В реальном приложении здесь будет полноценный markdown-текст с форматированием, ссылками и другими элементами.\n\n## Раздел 1\n\nТекст первого раздела с рассуждениями о литературе и культуре.\n\n## Раздел 2\n\nПродолжение текста с более конкретными примерами и анализом.`,
        author: "Иван Райбекас",
        coverUrl: `https://via.placeholder.com/300x200?text=Текст+${id}`,
        tags: selectedTags,
        publishedAt
    };
};

// Генерирует массив моковых текстов заданного размера
export const generateMockTexts = (count: number): Text[] => {
    const texts: Text[] = [];
    for (let i = 1; i <= count; i++) {
        texts.push(generateMockText(i));
    }
    return texts;
};