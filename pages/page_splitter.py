import os
import sys

def split_markdown(input_file, output_dir):
    """
    Splits a markdown file by '---' and saves the pages to the output directory.
    """
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: Input file not found at {input_file}")
        return
    except Exception as e:
        print(f"An error occurred while reading the file: {e}")
        return

    pages = content.split('---')

    for i, page_content in enumerate(pages):
        if page_content.strip():
            output_filename = os.path.join(output_dir, f"page_{i + 1}.md")
            try:
                with open(output_filename, 'w', encoding='utf-8') as out_f:
                    out_f.write(page_content.strip())
                print(f"Saved {output_filename}")
            except Exception as e:
                print(f"An error occurred while writing to file {output_filename}: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python page_splitter.py <input_markdown_file> <output_directory>")
        sys.exit(1)

    input_file_path = sys.argv[1]
    output_directory_path = sys.argv[2]

    split_markdown(input_file_path, output_directory_path)

