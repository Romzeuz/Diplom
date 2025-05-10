export interface Text {
  id: number;
  title: string;
  content: string;
  author: string;
  coverUrl: string;
  tags: string[];
  publishedAt: string;
}

export interface Author {
  id: number;
  name: string;
  bio: string;
  timeline: TimelineEvent[];
}

export interface TimelineEvent {
  id: number;
  year: number;
  title: string;
  description: string;
}

export interface AIExplanation {
  explanation: string;
  links?: string[];
}