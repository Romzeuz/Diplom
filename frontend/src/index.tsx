import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import {ConfigProvider} from 'antd';
import ru_RU from 'antd/lib/locale/ru_RU';

const root = ReactDOM.createRoot(
    document.getElementById('root') as HTMLElement
);

root.render(
    <React.StrictMode>
        <ConfigProvider
            locale={ru_RU}
            theme={{
                token: {
                    colorPrimary: '#ACCFF2',
                    borderRadius: 4,
                    // Добавляем глобальный шрифт здесь
                    fontFamily: '"IBM Plex Sans", "Segoe UI", Roboto, ' +
                        'Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", ' +
                        '"Helvetica Neue", sans-serif',
                },
            }}
        >
            <App/>
        </ConfigProvider>
    </React.StrictMode>
);

reportWebVitals();