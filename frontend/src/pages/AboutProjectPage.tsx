import React from 'react';
import ImagePane, {AlignEnum} from '../components/ImagePane';
import TeamCard from '../components/TeamCard/TeamCard';
import './styles/AboutProjectPage.css';

const teamData = [
    {
        name: 'Вероника Леонтьева',
        role: 'Дизайнер',
        defaultImage: '/nika-mu.png',
        hoverImage: '/10.jpg',
    },
    {
        name: 'Артём Майдуров',
        role: 'Консультант',
        defaultImage: '/artem-mu.png',
        hoverImage: '/25 (2).jpg',
    },
    {
        name: 'Вячеслав Бойко',
        role: 'Заказчик',
        defaultImage: '/slava-mu.png',
        hoverImage: '/12.jpg',
    },
    {
        name: 'Роман Донец',
        role: 'Бэкенд разработчик',
        defaultImage: '/roma-mu.png',
        hoverImage: '/15.jpg',
    },
    {
        name: 'Илья Нигматуллин',
        role: 'Научный руководитель',
        defaultImage: '/ilya-mu.png',
        hoverImage: '/7.jpg',
    },
];

const AboutProjectPage: React.FC = () => {
    return (
        <div className="about-project-page">
            <div style={{marginBottom: '100px'}}>
                <ImagePane
                    Align={AlignEnum.LEFT}
                    ImageComponent={<img src="/Альберт Янович.png" alt="Digital Raibekas" style={{maxWidth: '500px'}}/>}
                    HeaderComponent={<h1 style={{
                        fontSize: 'clamp(36px, 6vw, 96px)',
                        fontWeight: '500',
                    }}>Цифровой Райбекас</h1>}
                    TextCardComponent={
                        <div>
                            <p style={{maxWidth: 400}}>платформа, созданная для того, чтобы вернуть голос философа в культурное пространство и
                                показать, как мысли, рожденные в Сибири, могут звучать современно, мощно и точно.</p>
                            <p style={{textAlign: 'right', marginTop: '40px'}}>Проект посвящён философскому наследию
                                Альберта Яновича Райбекаса — основателя кафедры философии в Красноярске, мыслителя,
                                работавшего на стыке науки и гуманитарного знания, философа, который верил в диалектику
                                как живой метод мышления и понимания мира. Его труды, долго остававшиеся в тени,
                                получают здесь новое дыхание в цифровой среде.</p>
                        </div>
                    }
                    TextOverlapX={-10}
                />
            </div>
            <div className="team-section">
                <h2 style={{
                    fontSize: 32,
                    fontWeight: '500',
                    textAlign: "left"
                }}>Наша команда</h2>
                <div className="team-container">
                    {teamData.map((member, index) => (
                        <TeamCard
                            key={index}
                            name={member.name}
                            role={member.role}
                            defaultImage={member.defaultImage}
                            hoverImage={member.hoverImage}
                        />
                    ))}
                </div>
            </div>
        </div>
    );
};

export default AboutProjectPage;
