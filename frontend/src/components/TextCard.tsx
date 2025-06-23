import React, {useRef, useEffect} from 'react';
import {Card, Tag, Typography} from 'antd';
import {Link} from 'react-router-dom';
import {Text} from '../types';
import {mediaApi} from "../api/strapiClient";
import './TextCard.css'; // Assuming you have a CSS file for styles

interface TextCardProps {
    text: Text;
}

const TextCard: React.FC<TextCardProps> = ({text}) => {
    const cardRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        const card = cardRef.current;
        if (!card) return;

        const handleMouseMove = (e: MouseEvent) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            card.style.setProperty('--mouse-x', `${x}px`);
            card.style.setProperty('--mouse-y', `${y}px`);
        };

        card.addEventListener('mousemove', handleMouseMove);

        return () => {
            card.removeEventListener('mousemove', handleMouseMove);
        };
    }, []);

    console.log(text.tags);
    return (
        <div ref={cardRef}>
            <Link to={`/text/${text.documentId}`}>
                <Card
                    cover={<img alt={text.title} src={mediaApi.getMediaUrl(text.logo?.url)}
                                style={{borderTopLeftRadius: 15, borderTopRightRadius: 15}}/>}
                    style={{marginBottom: 16, background: '#ACCFF266'}}
                    className="text-card"
                    variant="borderless"
                >
                    <Card.Meta
                        title={text.title}
                        description={
                            <span>
                                {text.text_type?.name}
                            </span>
                        }
                        avatar={<Typography.Paragraph style={{fontSize: '48px', color: '#1E252C80'}}>{text.date && <>‘{text.date.split('-')[0].slice(2)}</>}</Typography.Paragraph>}
                    />
                    <div>
                        {text.text_author_type &&
                            <Tag key={text.text_author_type.id} className="author-tag"
                                 style={{
                                     color: text.text_author_type.color,
                                     border: `1px solid ${text.text_author_type.color}`
                                 }}>
                                {text.text_author_type.title}
                            </Tag>}
                    </div>
                    <div style={{marginTop: 17}}>
                        {text.tags.map(tag => (
                            <Tag key={tag.id} className="tag">{tag.title}</Tag>
                        ))}
                    </div>
                </Card>
            </Link>
        </div>
    );
};

export default TextCard;