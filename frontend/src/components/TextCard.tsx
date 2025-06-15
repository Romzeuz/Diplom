import React from 'react';
import {Card, Tag, Typography} from 'antd';
import {Link} from 'react-router-dom';
import {Text} from '../types';
import {mediaApi} from "../api/strapiClient";
import './TextCard.css'; // Assuming you have a CSS file for styles

interface TextCardProps {
    text: Text;
}

const TextCard: React.FC<TextCardProps> = ({text}) => {
    return (
        <Link to={`/text/${text.documentId}`}>
            <Card
                cover={<img alt={text.title} src={mediaApi.getMediaUrl(text.logo?.url)}/>}
                style={{marginBottom: 16, background: '#ACCFF266'}}
                className="text-card"
            >
                <Card.Meta
                    title={text.title}
                    description={<>
                    {text.authors.map((author, index) => (
                        <span key={author.id}>
                            {author.name}
                            {index < text.authors.length - 1 ? ', ' : ''}
                        </span>
                    ))}
                    </>}
                    avatar={<Typography.Paragraph style={{fontSize: '48px', color: '#1E252C80'}}>
                        ‘87
                    </Typography.Paragraph>}
                />
                <div style={{marginTop: 8}}>
                    {text.tags.map(tag => (
                        <Tag key={tag.id}>{tag.title}</Tag>
                    ))}
                </div>
            </Card>
        </Link>
    );
};

export default TextCard;