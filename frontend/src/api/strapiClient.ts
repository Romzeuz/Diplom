import axios from 'axios';
import {API_CONFIG} from './config';
import {Text, Author, StrapiResponse, Tag, TimelineEvent, Page} from '../types';
import qs from 'qs';

const strapiClient = axios.create({
    baseURL: API_CONFIG.STRAPI_BASE_URL,
    headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${API_CONFIG.STRAPI_API_KEY}`,
    },
    // params: {
    //     populate: "*",
    // }
});

export const textApi = {
    getTexts: async (params?: { search?: string; tags?: string[]; authorName?: string },
                     pagination?: { page: number, pageSize: number }): Promise<StrapiResponse<Text[]>> => {
        const query = qs.stringify({
            filters: {
                title: {
                    $contains: params?.search,
                },
                tags: {
                    documentId: {
                        $eq: params?.tags,
                    },
                },
                authors: {
                    name: {
                        $contains: params?.authorName,
                    },
                },
            },
            pagination: {
                page: pagination?.page || 1,
                pageSize: pagination?.pageSize || 12,
            },
            populate: ["authors", "tags", "text_type", "logo"],
        });
        const response = await strapiClient.get(`/texts?${query}`);
        const data = response.data.data;
        return {
            data,
            meta: {
                total: parseInt(response.data.meta.pagination.total),
                page: parseInt(response.data.meta.pagination.page),
                pageSize: parseInt(response.data.meta.pagination.pageSize),
                pageCount: parseInt(response.data.meta.pagination.pageCount),
            },
        };
    },

    getText: async (id: string): Promise<Text> => {
        const response = await strapiClient.get(`/texts/${id}`, {params: {populate: "*"}});
        return response.data.data;
    },

    getPages: async (textId: string, pageNumber: number): Promise<StrapiResponse<Page | null>> => {
        const response = await strapiClient.get(`/pages`, {
            params: {
                filters: {
                    parent: {
                        documentId: {
                            $eq: textId,
                        },
                    },
                },
                populate: "*",
                pagination: {
                    page: pageNumber,
                    pageSize: 1,
                },
                sort: ['page_number', 'id'],
            }
        });
        return {
            data: response.data.data[0] || null,
            meta: {
                total: parseInt(response.data.meta.pagination.total),
                page: parseInt(response.data.meta.pagination.page),
                pageSize: parseInt(response.data.meta.pagination.pageSize),
                pageCount: parseInt(response.data.meta.pagination.pageCount),
            },
        };
    }
};

export const authorApi = {
    getRaibekasInfo: async (): Promise<Author> => {
        const response = await strapiClient.get('/authors', {
            params: {
                "filters[name][$eq]": "Райбекас Альберт Янович",
                populate: "*"
            }
        });
        console.log(response.data);
        const data = response.data.data[0];
        return data;
    },

    getAuthorTimeline: async (authorName: string): Promise<TimelineEvent[]> => {
        const params: string = qs.stringify({
            filters: {
                author: {
                    name: {
                        $eq: authorName,
                    },
                },
            },
            sort: 'date',
            populate: '*'
        })
        const response = await strapiClient.get(`/timelines?${params}`);
        return response.data.data;
    }
};

export const tagApi = {
    getTags: async (): Promise<Tag[]> => {
        const response = await strapiClient.get('/tags', {params: {populate: "*"}});
        return response.data.data;
    },
}

export const mediaApi = {
    getMediaUrl: (src: string): string => {
        return API_CONFIG.STRAPI_MEDIA_URL + src;
    },
}

export default strapiClient;