export const API_CONFIG = {
    USE_MOCKS: process.env.REACT_APP_USE_MOCK_API === 'true',
    STRAPI_BASE_URL: process.env.REACT_APP_STRAPI_API_URL || 'http://localhost:1337/api',
    STRAPI_MEDIA_URL: process.env.REACT_APP_STRAPI_MEDIA_URL || 'http://localhost:1337',
    AI_BASE_URL: process.env.REACT_APP_AI_API_URL || 'http://localhost:8000/api',
    STRAPI_API_KEY: process.env.REACT_APP_STRAPI_API_KEY || '',
};