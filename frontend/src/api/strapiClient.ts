import axios from 'axios';
import {API_CONFIG} from './config';
import {Text, Author, StrapiResponse, Tag} from '../types';

const strapiClient = axios.create({
    baseURL: API_CONFIG.STRAPI_BASE_URL,
    headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${API_CONFIG.STRAPI_API_KEY}`,
    },
    params: {
        populate: "*",
    }
});

export const textApi = {
    getTexts: async (params?: { search?: string; tags?: string[]; authorName?: string }): Promise<StrapiResponse<Text[]>> => {
        const qs = require('qs');
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
            }
        });
        console.log(query);
        const response = await strapiClient.get(`/texts?${query}`);
        console.log(response.data);
        const data = response.data.data;
        console.log('data', data);
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
};

export const authorApi = {
    getRaibekasInfo: async (): Promise<Author> => {
        const response = await strapiClient.get('/authors', {params: {"filters[name][$eq]": "Альберт Янович Райбекас", populate: "*"}});
        console.log(response.data);
        const data = response.data.data[0];
        return data;
    },
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