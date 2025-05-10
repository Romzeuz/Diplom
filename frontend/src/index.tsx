import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import {ConfigProvider} from 'antd';
import ru_RU from 'antd/lib/locale/ru_RU';
// import {worker} from "./mocks/browser";

// if (process.env.NODE_ENV === 'development') {
//     // Запуск сервера MSW только в режиме разработки
//     worker.listen({
//         onUnhandledRequest: 'bypass',
//     });
// }

const root = ReactDOM.createRoot(
    document.getElementById('root') as HTMLElement
);

root.render(
    <React.StrictMode>
        <ConfigProvider
            locale={ru_RU}
            theme={{
                token: {
                    colorPrimary: '#1890ff',
                    borderRadius: 4,
                },
            }}
        >
            <App/>
        </ConfigProvider>
    </React.StrictMode>
);

reportWebVitals();