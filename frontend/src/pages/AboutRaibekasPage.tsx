import React, {useEffect, useState} from 'react';
import {Spin, Timeline, Typography} from 'antd';
import {authorApi, textApi} from '../api/strapiClient';
import {Author} from '../types';
import "./AboutRaibekasPage.css"
import {API_CONFIG} from '../api/config';
import {SaveFilled} from "@ant-design/icons"; // Импорт API_CONFIG

const {Title, Paragraph} = Typography;

const AboutRaibekasPage: React.FC = () => {
    const [author, setAuthor] = useState<Author | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchAuthorData = async () => {
            setLoading(true);
            try {
                const data = await authorApi.getRaibekasInfo();
                data.texts = (await textApi.getTexts()).data;
                data.timeline = await authorApi.getAuthorTimeline(data.name);
                console.log(data);
                setAuthor(data);
            } catch (error) {
                console.error('Ошибка при загрузке информации об авторе:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchAuthorData();
    }, []);

    if (loading) {
        return (
            <div style={{textAlign: 'center', padding: '40px 0'}}>
                <Spin size="large"/>
            </div>
        );
    }

    if (!author) {
        return <div>Информация об авторе не найдена</div>;
    }
    console.log(author);

    return (
        <div className="about-raibekas-page">
            <Title className="raibekas-title">Альберт Янович Райбекас</Title>
            <div className="paragraphs-container">
                <Paragraph className="raibekas-paragraph paragraph-left">
                    выдающийся философ, учёный и педагог, основатель философской школы в Красноярске и один из самых
                    оригинальных продолжателей диалектического материализма в постсоветской России. Несмотря на трудное
                    детство и репрессии в семье, он получил блестящее образование, объединив философское и
                    естественнонаучное мышление, и стал автором глубокой онтологической концепции, изложенной в книге
                    «Вещь,
                    свойство, отношение», которая до сих пор актуальна и цитируема.
                </Paragraph>
                <Paragraph className="raibekas-paragraph paragraph-right">
                    Он стал первым заведующим кафедрой философии в Красноярском университете, создал философскую школу,
                    организовал диссертационный совет и развивал философское сообщество в регионе. Райбекас был не
                    только
                    мыслителем, но и человеком выдающихся личных качеств: мастер спорта по самбо, интеллигент, душа
                    компании
                    и верный друг. Его философия сочетала строгость и глубину, а стиль мышления, который он оставил
                    после
                    себя, и сегодня вдохновляет новое поколение исследователей.
                </Paragraph>
            </div>
            <Timeline
                mode="alternate"
                className="custom-timeline" // Добавлен класс для кастомных стилей
                items={author.timeline.map((te, i) => {
                    const formattedDate = new Date(te.date).toLocaleDateString('ru-RU', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric'
                    });
                    return {
                        label: <Paragraph
                            style={{
                                marginLeft: 20,
                                marginRight: 20,
                                fontSize: 20,
                                fontWeight: 300,
                            }}
                        >
                            {formattedDate}
                        </Paragraph>,
                        children: (
                            <div className="timeline-event">
                                {te.media && te.media.url && (
                                    <img
                                        src={`${API_CONFIG.STRAPI_MEDIA_URL}${te.media.url.slice(8)}`}
                                        alt={te.caption || 'Timeline image'}
                                        // style={{ maxWidth: '100%', maxHeight: '300px', marginBottom: '16px', marginTop: -40}}
                                    />
                                )}
                                <p>{te.caption}</p>
                            </div>
                        ),
                    };
                })}
            />
        </div>
    );
};

export default AboutRaibekasPage;