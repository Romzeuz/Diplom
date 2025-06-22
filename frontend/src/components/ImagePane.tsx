import React, { useState, useEffect } from 'react';

export enum AlignEnum {
    LEFT = 'left',
    RIGHT = 'right',
    CENTER = 'center',
}

interface ImagePaneProps {
    ImageComponent: React.ReactNode;
    HeaderComponent: React.ReactNode;
    TextCardComponent: React.ReactNode;
    Align?: AlignEnum;
    HeaderMargin?: number; // Вертикальный отступ для заголовка внутри текстового блока (до применения overlap)
    ParagraphMargin?: number; // Вертикальный отступ для параграфа от заголовка
    TextAlign?: 'left' | 'center' | 'right' | 'justify';
    TextMargin?: number; // Базовый горизонтальный отступ всего текстового блока от изображения (до наложения)
    LinkHref?: string;

    // Пропсы для контроля наложения заголовка
    HeaderOverlapX?: number; // Горизонтальное "заползание" заголовка на изображение
    HeaderOverlapY?: number; // Вертикальное смещение заголовка (относительно его начальной позиции)

    // Пропсы для контроля наложения основного текста
    TextOverlapX?: number; // Горизонтальное "заползание" основного текста на изображение
    TextOverlapY?: number; // Вертикальное смещение основного текста (относительно его начальной позиции)
    maxTextWidth?: string | number; // Новое свойство для максимальной ширины текста
}

const ImagePane: React.FC<ImagePaneProps> = ({
                                                 ImageComponent,
                                                 HeaderComponent,
                                                 TextCardComponent,
                                                 Align = AlignEnum.LEFT,
                                                 HeaderMargin = 0,
                                                 ParagraphMargin = 30, // Изменено с 10 на 15 для увеличения зазора
                                                 TextAlign = 'left',
                                                 TextMargin = 0,
                                                 LinkHref,
                                                 HeaderOverlapX = 30,
                                                 HeaderOverlapY = 50,
                                                 TextOverlapX = 30,
                                                 TextOverlapY = 20, // Пример значения, можно настроить
                                                 maxTextWidth, // Получаем новое свойство
                                             }) => {
    const [isMobile, setIsMobile] = useState(false);

    useEffect(() => {
        const checkIsMobile = () => {
            setIsMobile(window.innerWidth < 1024); // Примерная точка перелома для мобильных
        };
        checkIsMobile(); // Первоначальная проверка
        window.addEventListener('resize', checkIsMobile);
        return () => window.removeEventListener('resize', checkIsMobile);
    }, []);

    const isLeft = Align === AlignEnum.LEFT;
    const isCenter = Align === AlignEnum.CENTER;

    const handlePaneClick = () => {
        if (LinkHref) {
            window.open(LinkHref, '_blank', 'noopener noreferrer');
        }
    };

    const paneStyle: React.CSSProperties = {
        display: 'flex',
        flexDirection: isMobile ? 'column' : (isCenter ? 'column' : (isLeft ? 'row' : 'row-reverse')),
        position: 'relative',
        cursor: LinkHref ? 'pointer' : 'default',
        alignItems: isCenter ? 'center' : 'stretch',
    };

    const imageContainerStyle: React.CSSProperties = {
        flexShrink: 0,
        position: 'relative',
        width: isMobile ? '90%' : 'auto', // Пример: изображение занимает большую часть ширины на мобильном
        marginBottom: isMobile ? '20px' : '0', // Отступ снизу для изображения на мобильном
        ...(isMobile && {
            display: 'flex',
            justifyContent: 'center',
        }),
        alignItems: isMobile ? 'center' : 'flex-start',
    };

    const textBlockStyle: React.CSSProperties = {
        display: 'flex',
        flexDirection: 'column',
        textAlign: isMobile ? 'left' : (isCenter ? 'center' : TextAlign), // Центрируем текст на мобильном
        position: 'relative',
        zIndex: 1,
        ...(isMobile ? {
            marginLeft: 0,
            marginRight: 0,
            width: '90%', // Текстовый блок также занимает большую часть ширины
            ...(maxTextWidth && { maxWidth: typeof maxTextWidth === 'number' ? `${maxTextWidth}px` : maxTextWidth }),
        } : {
            ...(isLeft
                ? { marginLeft: `${TextMargin}px` }
                : { marginRight: `${TextMargin}px` }),
            ...(isCenter && { marginTop: '-100px' }),
            ...(maxTextWidth && { maxWidth: typeof maxTextWidth === 'number' ? `${maxTextWidth}px` : maxTextWidth }),
        })
        // Удален transform отсюда, он теперь применяется к отдельным элементам (заголовок/параграф)
    };

    const headerWrapperStyle: React.CSSProperties = {
        marginTop: `${HeaderMargin}px`,
        transform: isMobile ? 'none' : `translate(${isLeft ? -(HeaderOverlapX ?? 0) : (HeaderOverlapX ?? 0)}px, ${HeaderOverlapY ?? 0}px)`,
        width: '100%', // Заголовок занимает всю ширину текстового блока
        position: 'relative', // Для корректного zIndex, если потребуется
        zIndex: 2, // Заголовок потенциально выше параграфа в контексте наложения
        alignItems: isMobile ? 'center' : 'flex-start',
    };

    const paragraphWrapperStyle: React.CSSProperties = {
        marginTop: `${ParagraphMargin}px`,
        transform: isMobile ? 'none' : `translate(${isLeft ? -(TextOverlapX ?? 0) : (TextOverlapX ?? 0)}px, ${TextOverlapY ?? 0}px)`,
        width: '100%', // Параграф занимает всю ширину текстового блока
        position: 'relative',
        zIndex: 1,
    };

    return (
        <div
            style={paneStyle}
            onClick={handlePaneClick}
            role={LinkHref ? "link" : undefined}
            tabIndex={LinkHref ? 0 : undefined}
            onKeyDown={(e) => {
                if ((e.key === 'Enter' || e.key === ' ') && LinkHref) {
                    e.preventDefault();
                    handlePaneClick();
                }
            }}
            // aria-label можно добавить, если содержимое не описывает ссылку достаточно
            aria-label={LinkHref ? "Подробнее" : undefined}
        >
            <div style={imageContainerStyle}>
                {ImageComponent}
            </div>
            <div style={textBlockStyle}>
                <div style={headerWrapperStyle}>
                    {HeaderComponent}
                </div>
                <div style={paragraphWrapperStyle}>
                    {TextCardComponent}
                </div>
            </div>
        </div>
    );
};

export default ImagePane;
