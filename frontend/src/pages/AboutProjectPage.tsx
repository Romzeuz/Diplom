import React from 'react';
import ImagePane, { AlignEnum } from '../components/ImagePane';
import './styles/AboutProjectPage.css';

const AboutProjectPage: React.FC = () => {
    return (
        <div className="about-project-page">
            <div style={{ marginBottom: '100px' }}>
                <ImagePane
                    Align={AlignEnum.LEFT}
                    ImageComponent={<img src="/text-raibekas.png" alt="Digital Raibekas" style={{maxWidth: '500px'}}/>}
                    HeaderComponent={<h1>Цифровой Райбекас</h1>}
                    TextCardComponent={
                        <div>
                            <p>платформа, созданная для того, чтобы вернуть голос философа в культурное пространство и показать, как мысли, рожденные в Сибири, могут звучать современно, мощно и точно.</p>
                            <p style={{ textAlign: 'right', marginTop: '20px' }}>Проект посвящён философскому наследию Альберта Яновича Райбекаса — основателя кафедры философии в Красноярске, мыслителя, работавшего на стыке науки и гуманитарного знания, философа, который верил в диалектику как живой метод мышления и понимания мира. Его труды, долго остававшиеся в тени, получают здесь новое дыхание в цифровой среде.</p>
                        </div>
                    }
                />
            </div>
            <div style={{ marginBottom: '100px' }}>
                <ImagePane
                    Align={AlignEnum.CENTER}
                    ImageComponent={<img src="/neuro-raibekas.png" alt="About the project" style={{maxWidth: '500px'}}/>}
                    HeaderComponent={<></>}
                    TextCardComponent={
                        <div style={{textAlign: 'center'}}>
                            <p>Цифровой Райбекас — это не архив, не просто база текстов. Это:</p>
                            <ul style={{ display: 'inline-block', textAlign: 'left' }}>
                                <li>Корпус трудов философа — от фундаментальных книг до редких лекций и статей.</li>
                                <li>Собрание исследований о нём — чтобы видеть не только мысли, но и эхо, которое они вызвали.</li>
                                <li>Интерактивный чат-бот, обученный на текстах Райбекаса, — проводник в его идеи, собеседник, способный объяснить сложное простыми словами.</li>
                                <li>Место диалога между прошлым и настоящим, академическим и личным, философией и культурой.</li>
                            </ul>
                        </div>
                    }
                />
            </div>
            <div style={{ marginBottom: '100px' }}>
                <ImagePane
                    Align={AlignEnum.RIGHT}
                    ImageComponent={<img src="/path/to/your/image3.jpg" alt="Project goal" style={{maxWidth: '500px'}}/>}
                    HeaderComponent={<></>}
                    TextCardComponent={
                        <p>Проект ставит своей целью не только сохранить и оцифровать философское наследие, но и сделать его живым — доступным студенту, преподавателю, исследователю или просто человеку, ищущему смысл в словах и в мире.</p>
                    }
                />
            </div>
            <div>
                <ImagePane
                    Align={AlignEnum.LEFT}
                    ImageComponent={<img src="/path/to/your/image4.jpg" alt="Digital representation" style={{maxWidth: '500px'}}/>}
                    HeaderComponent={<></>}
                    TextCardComponent={
                        <p>Цифровая репрезентация философии Райбекаса — это вклад в культурную идентичность Сибири, её интеллектуальную историю и будущее. Это способ напомнить: философия не в музее, она — в разговоре, в мышлении, в сети.</p>
                    }
                />
            </div>
        </div>
    );
};

export default AboutProjectPage;
