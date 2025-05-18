import axios from 'axios';
import {API_CONFIG} from './config';
import {Text, Author, StrapiResponse} from '../types';
import {useParams} from "react-router-dom";

const strapiClient = axios.create({
    baseURL: API_CONFIG.STRAPI_BASE_URL,
    headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${API_CONFIG.STRAPI_API_KEY}`,
    },
});

export const textApi = {
    getTexts: async (params?: { search?: string; tags?: string[] }): Promise<StrapiResponse<Text[]>> => {
        const response = await strapiClient.get('/texts', {params: {...params, populate: "*"}});
        console.log(response.data);
        const data = response.data.data.map((item: any) => ({
            ...item
        }))
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

    getText: async (id: number): Promise<Text> => {
        const response = await strapiClient.get(`/texts/${id}`);
        return {
            id: response.data.data.id,
            ...response.data.data.attributes,
        };
    },
};

export const authorApi = {
    getRaibekasInfo: async (): Promise<Author> => {
        const response = await strapiClient.get('/authors', {params: {"filters[name][$eq]": "Альберт Янович Райбекас", populate: "*"}});
        console.log(response.data);
        const data = response.data.data[0];
        return {
            ...data
        };
    },
};

export const tagApi = {
    getTags: async (): Promise<string[]> => {
        const response = await strapiClient.get('/tags');
        return response.data.data.map((item: any) => item.attributes.name);
    },
}

export const mediaApi = {
    getMediaUrl: (src: string): string => {
        return API_CONFIG.STRAPI_MEDIA_URL + src;
    },
}

export default strapiClient;