import React from 'react';
import {Card, Tag} from 'antd';
import {Link} from 'react-router-dom';
import {Text} from '../types';
import {mediaApi} from "../api/strapiClient";

interface TextCardProps {
    text: Text;
}

const TextCard: React.FC<TextCardProps> = ({text}) => {
    return (
        <Link to={`/text/${text.id}`}>
            <Card
                hoverable
                cover={<img alt={text.title} src={mediaApi.getMediaUrl(text.logo?.url)}/>}
                style={{marginBottom: 16}}
            >
                <Card.Meta
                    title={text.title}
                    description={String(text.authors)}
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