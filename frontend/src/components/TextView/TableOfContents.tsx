import '@ant-design/v5-patch-for-react-19';
import React from 'react';
import {Typography, Divider, Anchor} from 'antd';

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

    return (
        <>
            <Title level={4}>Содержание</Title>
            <Anchor
                items={items.map(item => ({
                    key: item.slug,
                    href: `#${item.slug}`,
                    title: item.title,
                }))}
                affix={false}
                showInkInFixed={false}
                style={{ marginBottom: '16px' }}
            />
            <Divider />
        </>
    );
};

export default TableOfContents;

