import {setupServer} from 'msw/node';
import {http, HttpResponse} from "msw";
import {handlers} from './handlers';

export const worker = setupServer(...handlers);