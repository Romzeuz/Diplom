import '@ant-design/v5-patch-for-react-19';
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
                components: {
                    Timeline: {
                        dotBg: 'black',
                        tailColor: 'black',
                        tailWidth: '3px',
                        colorPrimary: 'black',
                        dotBorderWidth: '3px',
                    },
                    Layout: {
                        lightSiderBg: 'transparent',
                    },

                },
                token: {
                    colorPrimary: '#ACCFF2',
                    colorInfo: '#ACCFF2',
                    colorLink: '#ACCFF2',
                    borderRadius: 4,

                    // Добавляем глобальный шрифт здесь
                    fontFamily: '"IBM Plex Sans", "Segoe UI", Roboto, ' +
                        'Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", ' +
                        '"Helvetica Neue", sans-serif',
                    fontSize: 16,
                    colorTextBase: '#1E252C',
                    lineHeight: 1.6,
                    lineHeightSM: 1.5,

                    // Добавляем цвета фона из токенов
                },
            }}
        >
            <App/>
        </ConfigProvider>
    </React.StrictMode>
);

reportWebVitals();