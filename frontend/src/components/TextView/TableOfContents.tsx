import React from 'react';
import { Typography, Divider } from 'antd';

const { Title } = Typography;

interface TocItem {
    level: number;
    title: string;
    slug: string;
}

interface TableOfContentsProps {
    items: TocItem[];
}

const TableOfContents: React.FC<TableOfContentsProps> = ({ items }) => {
    if (items.length === 0) {
        return null;
    }

    const handleClick = (e: React.MouseEvent<HTMLAnchorElement>, href: string) => {
        e.preventDefault();
        const id = href.substring(1);
        const element = document.getElementById(id);
        if (element) {
            element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    };

    return (
        <>
            <Title level={4}>Содержание</Title>
            <div className="ant-anchor-wrapper" style={{ maxHeight: 'calc(100vh - 400px)', overflowY: 'auto' }}>
                <div className="ant-anchor">
                    {items.map(item => (
                        <div className="ant-anchor-link" key={item.slug}>
                            <a
                                className="ant-anchor-link-title"
                                href={`#${item.slug}`}
                                title={item.title}
                                onClick={(e) => handleClick(e, `#${item.slug}`)}
                                style={{ paddingLeft: `${(item.level - 1) * 16}px` }}
                            >
                                {item.title}
                            </a>
                        </div>
                    ))}
                </div>
            </div>
            <Divider />
        </>
    );
};

export default TableOfContents;

