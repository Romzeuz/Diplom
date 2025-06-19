import os
import cv2
import pytesseract
import numpy as np
from PIL import Image
from pdf2image import convert_from_path
from pytesseract import Output

# 👉 Укажи путь к Tesseract, если Windows
pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"

# Входной PDF
PDF_PATH = "first book_recognized.pdf"

# Выходные директории
OUTPUT_DIR = "output"
IMG_DIR = os.path.join(OUTPUT_DIR, "images")
os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(IMG_DIR, exist_ok=True)

# Конвертация PDF в изображения (по страницам)
images = convert_from_path(PDF_PATH, dpi=300)
print(f"[✓] Получено {len(images)} страниц")

def detect_figures(image_pil, page_num):
    """
    Находит крупные объекты (схемы, рисунки) на изображении и сохраняет их.
    """
    image_cv = cv2.cvtColor(np.array(image_pil), cv2.COLOR_RGB2BGR)
    gray = cv2.cvtColor(image_cv, cv2.COLOR_BGR2GRAY)
    _, thresh = cv2.threshold(gray, 230, 255, cv2.THRESH_BINARY_INV)

    contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    img_paths = []
    count = 0

    for cnt in contours:
        x, y, w, h = cv2.boundingRect(cnt)
        if w * h < 30000:
            continue  # пропускаем мелкое
        fig = image_cv[y:y+h, x:x+w]
        fig_path = os.path.join(IMG_DIR, f"page{page_num}_img{count}.png")
        cv2.imwrite(fig_path, fig)
        img_paths.append((fig_path, y))
        count += 1

    return sorted(img_paths, key=lambda tup: tup[1])  # сортировка по вертикали

# Обработка каждой страницы
for i, image in enumerate(images, start=1):
    print(f"[~] Обработка страницы {i}")
    page_md_path = os.path.join(OUTPUT_DIR, f"page{i}.md")

    # Распознавание текста
    text = pytesseract.image_to_string(image, lang="rus")
    lines = text.split("\n")

    # Поиск изображений
    # fig_paths = detect_figures(image, i)

    # Сохраняем Markdown
    with open(page_md_path, "w", encoding="utf-8") as f:
        f.write(f"<!-- page: {i} -->\n\n")
        for idx, line in enumerate(lines):
            line = line.strip()
            if line:
                f.write(line + "\n")

            # # Каждые 15 строк — вставим схему, если она осталась
            # if fig_paths and idx % 15 == 0:
            #     fig_path, _ = fig_paths.pop(0)
            #     rel_path = os.path.relpath(fig_path, OUTPUT_DIR)
            #     f.write(f"![image]({rel_path})\n\n")

    print(f"[✓] Сохранён: {page_md_path}")
