import os
import re
from typing import List, Dict

import requests
from dotenv import load_dotenv

load_dotenv()

STRAPI_API_URL = os.getenv("STRAPI_API_URL", "http://localhost:1337")
STRAPI_TOKEN = os.getenv("STRAPI_TOKEN")

# Get the absolute path of the directory where the script is located.
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
# The 'output' directory is in the same directory as the script.
OUTPUT_DIR = os.path.join(SCRIPT_DIR, "output")


def upload_image(image_path):
    """Uploads an image to Strapi and returns the URL."""
    if not STRAPI_TOKEN:
        print("Strapi token not set.")
        return None

    url = f"{STRAPI_API_URL}/api/upload"
    headers = {"Authorization": f"Bearer {STRAPI_TOKEN}"}

    try:
        with open(image_path, "rb") as f:
            print(os.path.basename(image_path))
            files = (os.path.basename(image_path), f)
            print(files)

            response = requests.post(url, headers=headers, files=[(os.path.basename(image_path), f.read())])
            response.raise_for_status()
            return response.json()[0]["url"]
    except requests.exceptions.RequestException as e:
        print(f"Error uploading image {image_path}: {e}")
        if 'response' in locals() and hasattr(response, 'text'):
            print(f"Response content: {response.text}")
        return None
    except FileNotFoundError:
        print(f"Image file not found: {image_path}")
        return None
    # except Exception as e:
    #     print(f"An unexpected error occurred during image upload: {e}")
    #     return None


def create_text_entry(title, table_of_contents, key_words):
    """Creates a new text entry in Strapi."""
    if not STRAPI_TOKEN:
        print("Strapi token not set.")
        return None

    url = f"{STRAPI_API_URL}/api/texts"
    headers = {
        "Authorization": f"Bearer {STRAPI_TOKEN}",
        "Content-Type": "application/json",
    }
    data = {"data": {"title": title, "table_of_contents": table_of_contents, "key_words": key_words}}

    try:
        response = requests.post(url, headers=headers, json=data)
        response.raise_for_status()
        print(response.json())
        return response.json()["data"]["documentId"]
    except requests.exceptions.RequestException as e:
        print(f"Error creating text entry: {e}")
        if hasattr(e, 'response') and e.response is not None:
            print(f"Response content: {e.response.text}")
        return None


def create_page_entry(text_id, page_number, content):
    """Creates a new page entry in Strapi."""
    if not STRAPI_TOKEN:
        print("Strapi token not set.")
        return

    url = f"{STRAPI_API_URL}/api/pages"
    headers = {
        "Authorization": f"Bearer {STRAPI_TOKEN}",
        "Content-Type": "application/json",
    }
    data = {
        "data": {
            "page_number": page_number,
            "text": content,
            "parent": {
                "connect": [text_id]
            },
        }
    }

    try:
        response = requests.post(url, headers=headers, json=data)
        response.raise_for_status()
        print(f"Successfully created page {page_number} for text {text_id}")
    except requests.exceptions.RequestException as e:
        print(f"Error creating page entry: {e}")
        if hasattr(e, 'response') and e.response is not None:
            print(f"Response content: {e.response.text}")


def main():
    """Main function to process and upload markdown files."""
    if not os.path.exists(OUTPUT_DIR):
        print(f"Output directory not found: {OUTPUT_DIR}")
        return

    try:
        md_files = sorted(
            [f for f in os.listdir(OUTPUT_DIR) if f.endswith(".md")],
            key=lambda f: int(re.search(r'\d+', f).group(0)),
        )
    except (ValueError, AttributeError):
        print(
            "Could not sort markdown files by number. Please ensure they have numbers in their filenames (e.g., page1.md).")
        md_files = [f for f in os.listdir(OUTPUT_DIR) if f.endswith(".md")]

    if not md_files:
        print("No markdown files found in the output directory.")
        return

    KEY_WORDS = ["Ленин"]

    first_file_path = os.path.join(OUTPUT_DIR, md_files[0])
    title = "Untitled"
    try:
        with open(first_file_path, "r", encoding="utf-8") as f:
            content = f.read()
            title_match = re.search(r"^#\s+(.*)", content, re.MULTILINE)
            if title_match:
                title = title_match.group(1).strip()
    except FileNotFoundError:
        print(f"First markdown file not found: {first_file_path}")
        return

    table_of_contents = []
    all_pages_content = []
    key_words: Dict[str, List[int]]
    key_words = {kw.strip().lower(): [] for kw in KEY_WORDS if kw.strip()}

    for i, md_file in enumerate(md_files):
        page_number = i + 1
        file_path = os.path.join(OUTPUT_DIR, md_file)

        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()

                headings = re.findall(r"^#+\s+(.*)", content, re.MULTILINE)
                for heading in headings:
                    table_of_contents.append({"title": heading.strip(), "page_number": page_number})

                for key_word in KEY_WORDS:
                    if re.search(r'\b' + re.escape(key_word) + r'\b', content, re.IGNORECASE):
                        key_words[key_word.strip().lower()].append(page_number)

                # image_paths = re.findall(r'!\[.*?]\((.*?)\)', content)
                # for image_path in image_paths:
                #     full_image_path = os.path.normpath(os.path.join(OUTPUT_DIR, image_path))
                #
                #     if os.path.exists(full_image_path):
                #         strapi_image_url = upload_image(full_image_path)
                #         if strapi_image_url:
                #             content = content.replace(image_path, strapi_image_url)
                #     else:
                #         print(f"Image not found: {full_image_path}")

                all_pages_content.append(content)
        except FileNotFoundError:
            print(f"Markdown file not found: {file_path}")
            continue

    for kw, pages in key_words.items():
        key_words[kw] = sorted(list(set(pages)))

    text_id = create_text_entry(title, table_of_contents, key_words)

    if text_id:
        print(f"Created text entry with ID: {text_id}")
        for i, page_content in enumerate(all_pages_content):
            create_page_entry(text_id, i + 1, page_content)


if __name__ == "__main__":
    main()
