import '@ant-design/v5-patch-for-react-19';
import React, {useState, useEffect} from 'react';
import {useParams} from 'react-router-dom';
import {Typography, Spin, Tooltip, Layout, Flex} from 'antd';
import ReactMarkdown from 'react-markdown';
import {textApi} from '../api/strapiClient';
import {Text} from '../types';
import {BookOutlined, InfoCircleOutlined} from '@ant-design/icons';
import rehypeSlug from 'rehype-slug';
import {slugify} from 'transliteration';
import SidePanel from '../components/TextView/SidePanel';

const {Title, Paragraph} = Typography;
const {Content} = Layout;

const TextView: React.FC = () => {
    const {id} = useParams<{ id: string }>();
    const [text, setText] = useState<Text | null>(null);
    const [loading, setLoading] = useState(true);
    const [tocItems, setTocItems] = useState<{ level: number; title: string; slug: string }[]>([]);
    const [tocItemsMap, setTocItemsMap] = useState<{ [key: string]: { level: number; title: string; slug: string } }>({});
    const [selectedKeyword, setSelectedKeyword] = useState<string | null>(null);
    const [occurrenceCount, setOccurrenceCount] = useState(0);
    const [currentOccurrence, setCurrentOccurrence] = useState(0);

    useEffect(() => {
        const fetchText = async () => {
            if (!id) return;

            setLoading(true);
            try {
                const data = await textApi.getText(id);
                setText(data);

                // Generate ToC items from markdown
                const markdownText = data.text;
                const headingLines = markdownText.match(/^#+\s.*/gm) || [];
                const slugs: { [key: string]: number } = {};
                const items = headingLines.map(line => {
                    const level = line.match(/^#+/)?.[0].length || 1;
                    const title = line.replace(/^#+\s*/, '');
                    let slug = slugify(title, {lowercase: true, separator: '-'});

                    // Handle duplicate slugs to match rehype-slug behavior
                    if (slugs[slug] !== undefined) {
                        slugs[slug]++;
                        slug = `${slug}-${slugs[slug]}`;
                    } else {
                        slugs[slug] = 0;
                    }

                    return {level, title, slug};
                });

                const itemsMap = items.reduce((acc, item) => {
                    acc[item.slug] = item;
                    return acc;
                }, {} as {[key: string]: {level: number; title: string; slug: string }});
                setTocItemsMap(itemsMap);
                setTocItems(items);
            } catch (error) {
                console.error('Ошибка при загрузке текста:', error);
            } finally {
                setLoading(false);
            }
        };

        fetchText();
    }, [id]);

    useEffect(() => {
        if (selectedKeyword && text) {
            const regex = new RegExp(`\\b${selectedKeyword}\\b`, "gi");
            const count = (text.text.match(regex) || []).length;
            setOccurrenceCount(count);
            setCurrentOccurrence(0);
        } else {
            setOccurrenceCount(0);
        }
    }, [selectedKeyword, text]);

    useEffect(() => {
        if (selectedKeyword && occurrenceCount > 0) {
            const element = document.getElementById(`keyword-occurrence-${currentOccurrence}`);
            element?.scrollIntoView({
                behavior: 'smooth',
                block: 'center',
            });
        }
    }, [currentOccurrence, selectedKeyword, occurrenceCount]);

    const handlePrevOccurrence = () => {
        setCurrentOccurrence(prev => (prev > 0 ? prev - 1 : occurrenceCount - 1));
    };

    const handleNextOccurrence = () => {
        setCurrentOccurrence(prev => (prev < occurrenceCount - 1 ? prev + 1 : 0));
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
        h1: ({node, ...props}: any) => {
            const slug = slugify(props.children, {lowercase: true, separator: '-'});
            console.log(slug, props.children);
            const tocItem = tocItemsMap[slug];
            return (
                <h1 id={slug} {...props}>
                    {tocItem ? <a href={`#${slug}`} style={{color: 'inherit'}}>{props.children}</a> : props.children}
                </h1>
            );
        },
    };

    return (
        <Layout style={{background: 'transparent'}}>
            <SidePanel
                text={text}
                tocItems={tocItems}
                selectedKeyword={selectedKeyword}
                onKeywordSelect={setSelectedKeyword}
                occurrenceCount={occurrenceCount}
                currentOccurrence={currentOccurrence}
                onPrevOccurrence={handlePrevOccurrence}
                onNextOccurrence={handleNextOccurrence}
            />
            <Content style={{ padding: '0 24px' }}>
                <div className="text-view">
                    <Flex align="center" gap={10} style={{marginBottom: '16px'}}>
                        <BookOutlined style={{fontSize: '30px'}}/>
                        <Title level={3} style={{margin: 0}}>{text.title}</Title>
                    </Flex>
                    <Paragraph type="secondary">Авторы: {text.authors?.map(
                        (author, index) => (
                            <span key={author.id}>
                        {author.name}
                                {index < text.authors.length - 1 ? ', ' : ''}
                    </span>
                        )
                    )}</Paragraph>

                    <div
                        className="text-content"
                    >
                        <ReactMarkdown
                            children={text.text}
                            components={markdownComponents}
                        />
                    </div>
                </div>
            </Content>
        </Layout>
    );
};

export default TextView;