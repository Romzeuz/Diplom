export interface StrapiResponse<T> {
    data: T;
    meta: {
        page: number;
        pageSize: number;
        pageCount: number;
        total: number;
    };
}

export interface StrapiMedia {
    id: number;
    documentID: string;
    name: string;
    alternativeText: string;
    caption: string;
    width: number;
    height: number;
    formats: any;
    hash: string;
    ext: string;
    mime: string;
    size: number;
    url: string;
    previewUrl: string;
    provider: string;
    provider_metadata: any;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
}

export interface Text {
    id: number;
    documentId: string;
    title: string;
    text: string;
    date: string;
    annotation: string;
    authors: Author[];
    tags: Tag[];
    logo: StrapiMedia;
    text_type: TextType;
    text_author_type: TextAuthorType;
    keyWords: KeyWord[];
}

export interface Author {
    id: number;
    documentId: string;
    name: string;
    bio: string
    photo: StrapiMedia;
    texts: Text[];
    timeline: TimelineEvent[];
}

export interface Tag {
    id: number;
    documentId: string;
    title: string;
}

export interface TimelineEvent {
    id: number;
    documentId: string;
    date: string;
    caption: string;
    description: string;
    author: Author;
    media: StrapiMedia;
}

export interface AIExplanation {
    explanation: string;
    links?: string[];
}

export interface Test {
    id: number;
    message: string;
}

export interface LinkRequest {
    text: string;
    start_index: number;
    end_index: number;
    book_id: number;
}

export interface LinkResponse {
    text: string;
    link: string;
}

export interface TextType {
    id: number;
    documentId: string;
    name: string;
    color: string;
}

export interface TextAuthorType {
    id: number;
    documentId: string;
    title: string;
    color: string;
}

export interface KeyWord {
    id: number;
    documentId: string;
    keyWord: string;
}