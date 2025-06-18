import React, {useEffect} from 'react';
import {Row, Typography, Image} from 'antd';

import ImagePane, {AlignEnum} from "../components/ImagePane";

const {Title, Paragraph} = Typography;

const HomePage: React.FC = () => {
    return (
        <div className="home-page" style={{display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
            <Row gutter={[24, 24]} style={{marginTop: 48, width: '100%', maxWidth: 1440, justifyContent: 'flex-start'}}>
                <ImagePane
                    ImageComponent={<Image src={"/text-raibekas.png"} preview={false} style={{
                        height: 'auto',
                        maxHeight: 450,
                        width: 'auto',
                        maxWidth: '100%',
                        objectFit: 'contain'
                    }}/>}
                    HeaderComponent={
                        <Title
                            style={{
                                fontSize: 'clamp(60px, 6vw, 120px)',
                                fontWeight: '500',
                            }}
                        >
                            Цифровой<br/>Райбекас
                        </Title>
                    }
                    TextCardComponent={
                        <Paragraph style={{maxWidth: '100%'}}>
                            Интерактивный корпус философских работ, включающий книги,
                            лекции и редкие статьи. Платформа также содержит исследования
                            о философе и предлагает интерактивного чат-бота,
                            способного объяснять сложные идеи простым языком.
                            Это пространство диалога между прошлым и настоящим,
                            академией и личным опытом, философией и культурой.
                        </Paragraph>
                    }
                    HeaderOverlapX={50}
                    HeaderOverlapY={70}
                    TextOverlapX={10}
                    maxTextWidth={500}
                />
            </Row>
            <Row gutter={[24, 24]} style={{marginTop: 96, width: '100%', maxWidth: 1440, justifyContent: 'flex-end'}}>
                <ImagePane
                    ImageComponent={<Image src={"/neuro-raibekas.png"} preview={false} style={{
                        height: 'auto',
                        maxHeight: 450,
                        width: 'auto',
                        maxWidth: '100%',
                        objectFit: 'contain'
                    }}/>}
                    HeaderComponent={<Title level={3}>Райбекас: мысль и отражение</Title>}
                    TextCardComponent={
                        <Paragraph style={{maxWidth: '100%'}}>
                            Собрание авторских работ Альберта Яновича и публикаций
                            о нём — от академических исследований до личных воспоминаний.
                            Это пространство диалога между его идеями и их отражением в умах других.
                        </Paragraph>
                    }
                    Align={AlignEnum.RIGHT}
                    LinkHref={"/collection"}
                    maxTextWidth={"400"}
                />
            </Row>
            <Row gutter={[24, 24]} style={{marginTop: 96, width: '100%', maxWidth: 1440, justifyContent: 'flex-start'}}>
                <ImagePane
                    ImageComponent={<Image
                        preview={false}
                        style={{
                            height: 'auto',
                            maxHeight: 360,
                            width: 'auto',
                            maxWidth: '100%',
                            objectFit: 'contain'
                        }}
                        src={"/neuro-raibekas.png"}
                    />}
                    HeaderComponent={<Title level={3}>Путь философа</Title>}
                    TextCardComponent={
                        <Paragraph style={{maxWidth: '100%'}}>
                            Загляните на страницу с таймлайном, чтобы увидеть,
                            как складывалась жизнь Альберта Яновича — в датах,
                            событиях и фотографиях. Это простой и наглядный способ
                            познакомиться с его судьбой и философским путём.
                        </Paragraph>
                    }
                    LinkHref={"/about-raibekas"}
                    maxTextWidth={400}
                />
            </Row>
            <Row gutter={[24, 24]}
                 style={{marginTop: 120, width: '100%', maxWidth: 1440, justifyContent: 'flex-end', marginBottom: 96}}>
                <ImagePane
                    ImageComponent={<Image
                        preview={false}
                        style={{
                            height: 'auto',
                            maxHeight: 450,
                            width: 'auto',
                            maxWidth: '100%',
                            objectFit: 'contain'
                        }}
                        src={"/neuro-raibekas.png"}
                    />}
                    HeaderComponent={<Title level={3}>О проекте</Title>}
                    TextCardComponent={
                        <Paragraph style={{maxWidth: '100%'}}>
                            На странице «О проекте» представлена информация
                            о целях, идеях и концепции платформы, посвящённой
                            наследию Альберта Яновича Райбекаса.
                        </Paragraph>
                    }
                    Align={AlignEnum.RIGHT}
                    LinkHref={"/about-project"}
                    maxTextWidth={400}
                    TextOverlapY={250}
                    HeaderOverlapY={250}
                />
            </Row>
        </div>
    );
};

export default HomePage;
