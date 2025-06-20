import '@ant-design/v5-patch-for-react-19';
import React, {useState, useEffect} from 'react';
import {useParams} from 'react-router-dom';
import {Typography, Spin, Tooltip, Layout, Flex, Tag} from 'antd';
import ReactMarkdown from 'react-markdown';
import {textApi} from '../api/strapiClient';
import {Text, TocItem, Page} from '../types';
import {BookOutlined, InfoCircleOutlined, UserOutlined} from '@ant-design/icons';
import SidePanel from '../components/TextView/SidePanel';
import {Pagination} from 'antd';
import "./TextView.css";

const {Title, Paragraph} = Typography;
const {Content} = Layout;

const TextView: React.FC = () => {
    const {id} = useParams<{ id: string }>();
    const [text, setText] = useState<Text | null>(null);
    const [page, setPage] = useState<Page | null>(null)
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(1);
    const [loading, setLoading] = useState(true);
    const [selectedKeyword, setSelectedKeyword] = useState<string | null>(null);
    const [occurrenceCount, setOccurrenceCount] = useState(0);
    const [currentOccurrence, setCurrentOccurrence] = useState(0);

    const handlePrevOccurrence = () => {
        setCurrentOccurrence(prev => (prev > 0 ? prev - 1 : occurrenceCount - 1));
    };

    const handleNextOccurrence = () => {
        setCurrentOccurrence(prev => (prev < occurrenceCount - 1 ? prev + 1 : 0));
    };

    useEffect(() => {
        const fetchText = async () => {
            if (!id) return;

            setLoading(true);
            try {
                const data = await textApi.getText(id);
                setText(data);
            } catch (error) {
                console.error('Ошибка при загрузке текста:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchText();
    }, [id]);

    useEffect(() => {
        const fetchPage = async () => {
            if (!id) return;

            setLoading(true);
            try {
                const data = await textApi.getPages(id, currentPage);
                setPage(data.data);
                console.log('Fetched page:', data.data, data.meta);
                setTotalPages(data.meta.pageCount);
            } catch (error) {
                console.error('Ошибка при загрузке страницы:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchPage();
    }, [id, currentPage]);

    const handlePageChange = (page: number) => {
        setCurrentPage(page);
    };

    const handleKeywordSelect = (keyword: string | null) => {
        if (selectedKeyword === keyword || keyword === null) {
            setSelectedKeyword(null);
            setOccurrenceCount(0);
            setCurrentOccurrence(0);
        } else {
            setSelectedKeyword(keyword);
        }
    };

    if (loading) {
        return (
            <div style={{textAlign: 'center', padding: '40px 0'}}>
                <Spin size="large"/>
            </div>
        );
    }

    if (!text) {
        return <div>Текст не найден</div>;
    }

    let keywordOccurrenceIndex = 0;

    const markdownComponents = {
        p: ({node, ...props}: any) => {
            if (!selectedKeyword) {
                return <p {...props} />;
            }

            const children = React.Children.toArray(props.children);

            const newChildren = children.map((child: any) => {
                if (typeof child === 'string') {
                    const regex = new RegExp(`(${selectedKeyword})`, 'gi');
                    const parts = child.split(regex);
                    return parts.map((part, i) => {
                        if (part.toLowerCase() === selectedKeyword.toLowerCase()) {
                            const currentIndex = keywordOccurrenceIndex;
                            const isCurrent = currentIndex === currentOccurrence;
                            keywordOccurrenceIndex++;
                            return (
                                <span
                                    key={i}
                                    id={`keyword-occurrence-${currentIndex}`}
                                    style={{
                                        backgroundColor: isCurrent ? 'yellow' : '#dbeafe',
                                        borderRadius: '3px',
                                        padding: '2px 4px',
                                        fontWeight: isCurrent ? 'bold' : 'normal',
                                    }}
                                >
                                    {part}
                                </span>
                            );
                        }
                        return part;
                    });
                }
                return child;
            });

            return <p>{newChildren}</p>;
        },
        a: ({node, ...props}: any) => (
            <Tooltip title="Контекстная ссылка">
                <a {...props} target="_blank" rel="noopener noreferrer">
                    {props.children} <InfoCircleOutlined/>
                </a>
            </Tooltip>
        ),
    };

    return (
        <>
            <Flex align="center" gap={20} style={{marginBottom: '16px', padding: '0 24px'}}>
                <BookOutlined style={{fontSize: '36px'}}/>
                <Title level={3} style={{margin: 0}}>{text.title}</Title>
            </Flex>
            <Layout style={{background: 'transparent'}}>
                <SidePanel
                    text={text}
                    tocItems={text.table_of_contents}
                    selectedKeyword={selectedKeyword}
                    onKeywordSelect={handleKeywordSelect}
                    occurrenceCount={occurrenceCount}
                    currentOccurrence={currentOccurrence}
                    onPrevOccurrence={handlePrevOccurrence}
                    onNextOccurrence={handleNextOccurrence}
                    changePage={(pageNumber) => setCurrentPage(pageNumber)}
                />
                <Content style={{padding: '0 24px'}}>
                    <div>
                        <Paragraph style={{fontWeight: 400, marginBottom: '60px', fontSize: '24px'}}>
                            <UserOutlined style={{fontSize: '36px', marginRight: '20px'}}/>
                            {text.authors?.map(
                                (author, index) => (
                                    <span key={author.id}>
                                    {author.name}{index < text.authors.length - 1 ? ', ' : ''}
                                </span>
                                )
                            )}</Paragraph>

                        <div className="tag-container" style={{fontWeight: 400, marginBottom: '60px', fontSize: '24px'}}>
                            <div>
                                {text.tags.map(tag => (
                                    <Tag key={tag.id} className="tag">{tag.title}</Tag>
                                ))}
                            </div>
                        </div>

                        <div>
                            <ReactMarkdown
                                children={page?.text || ''}
                                components={markdownComponents}
                            />
                        </div>
                        <Pagination
                            current={currentPage}
                            total={totalPages}
                            pageSize={1}
                            onChange={handlePageChange}
                            style={{marginTop: '16px', textAlign: 'center', justifyContent: 'center'}}
                        />
                    </div>
                </Content>
            </Layout>
        </>
    );
};

export default TextView;
