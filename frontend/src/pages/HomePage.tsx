import React, {useEffect} from 'react';
import {Row, Col, Card, Button, Typography, Divider, Image} from 'antd';
import {Link} from 'react-router-dom';
import {aiApi} from "../api/aiClient";
import './HomePage.css';

import ImagePane, {AlignEnum} from "../components/ImagePane";
import Panel from "antd/es/splitter/Panel";

const {Title, Paragraph} = Typography;

const HomePage: React.FC = () => {
    return (
        <div className="home-page" style={{display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
            <Row gutter={[24, 24]} style={{marginTop: 48, width: '100%', maxWidth: 1440, justifyContent: 'flex-start'}}>
                <ImagePane ImageComponent={<Image src={"/text-raibekas.png"} preview={false} height={450}/>}
                           HeaderComponent={<Title style={{fontSize: 96}}>Цифровой<br/>Райбекас</Title>}
                           TextCardComponent={
                               <Paragraph className="pane" style={{width: 500}}>
                                   Интерактивный корпус философских работ, включающий книги,
                                   лекции и редкие статьи. Платформа также содержит исследования
                                   о философе и предлагает интерактивного чат-бота,
                                   способного объяснять сложные идеи простым языком.
                                   Это пространство диалога между прошлым и настоящим,
                                   академией и личным опытом, философией и культурой.
                               </Paragraph>
                           }
                           HeaderMargin={-100}
                />
            </Row>
            <Row gutter={[24, 24]} style={{marginTop: 96, width: '100%', maxWidth: 1440, justifyContent: 'flex-end'}}>
                <ImagePane
                    ImageComponent={<Image src={"/neuro-raibekas.png"} preview={false} height={450}/>}
                    HeaderComponent={<Title level={3}>Райбекас: мысль и отражение</Title>}
                    TextCardComponent={
                        <Paragraph className="pane" style={{width: 350}}>
                            Собрание авторских работ Альберта Яновича и публикаций
                            о нём — от академических исследований до личных воспоминаний.
                            Это пространство диалога между его идеями и их отражением в умах других.
                        </Paragraph>
                    }
                    HeaderMargin={-70}
                    Align={AlignEnum.RIGHT}
                    ParagraphMargin={-100}
                    TextAlign="bottom"
                    TextMargin={-40}
                    LinkHref={"/collection"}
                />
            </Row>
            <Row gutter={[24, 24]} style={{marginTop: 96, width: '100%', maxWidth: 1440, justifyContent: 'flex-start'}}>
                <ImagePane
                    ImageComponent={<Image
                        height={360}
                        width={580}
                        preview={false}
                    />}
                    HeaderComponent={<Title level={3}>Путь философа</Title>}
                    TextCardComponent={
                        <Paragraph className="pane" style={{width: 350}}>
                            Загляните на страницу с таймлайном, чтобы увидеть,
                            как складывалась жизнь Альберта Яновича — в датах,
                            событиях и фотографиях. Это простой и наглядный способ
                            познакомиться с его судьбой и философским путём.
                        </Paragraph>
                    }
                    HeaderMargin={-100}
                    ParagraphMargin={-100}
                    TextAlign="bottom"
                    TextMargin={-150}
                    LinkHref={"/about-raibekas"}
                />
            </Row>
            <Row gutter={[24, 24]} style={{marginTop: 96, width: '100%', maxWidth: 1440, justifyContent: 'flex-end', marginBottom: 96}}>
                <ImagePane
                    ImageComponent={<Image preview={false} height={450} width={680}/>}
                    HeaderComponent={<Title level={3}>О проекте</Title>}
                    TextCardComponent={
                        <Paragraph className="pane" style={{width: 350}}>
                            На странице «О проекте» представлена информация
                            о целях, идеях и концепции платформы, посвящённой
                            наследию Альберта Яновича Райбекаса.
                        </Paragraph>
                    }
                    HeaderMargin={-70}
                    Align={AlignEnum.RIGHT}
                    ParagraphMargin={-120}
                    TextAlign="bottom"
                    TextMargin={-280}
                    LinkHref={"/chat"}
                />
            </Row>
        </div>
    );
};

export default HomePage;
