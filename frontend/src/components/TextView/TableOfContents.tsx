import '@ant-design/v5-patch-for-react-19';
import React from 'react';
import {Typography, Divider, Anchor} from 'antd';
import {TocItem} from "../../types";

const { Title } = Typography;

interface TableOfContentsProps {
    items: TocItem[];
    changePage: (pageNumber: number) => void;
}

const TableOfContents: React.FC<TableOfContentsProps> = ({ items, changePage }) => {
    if (items === null || items?.length === 0) {
        return null;
    }
    console.log('TableOfContents items:', items);

    return (
        <>
            <Title level={4}>Содержание</Title>
            <Anchor
                items={items.map(item => ({
                    key: item.page_number,
                    href: `#${item.page_number}`,
                    title: item.title,
                }))}
                affix={false}
                showInkInFixed={false}
                style={{ marginBottom: '16px' }}
                onClick={(_, link) => {
                    console.log(link);
                    changePage(parseInt(link.href.slice(1), ));
                }}
            />
            <Divider />
        </>
    );
};

export default TableOfContents;

