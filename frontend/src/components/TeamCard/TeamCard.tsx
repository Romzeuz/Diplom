import React, { useState } from 'react';
import styles from './TeamCard.module.css';

interface TeamCardProps {
  name: string;
  role: string;
  defaultImage: string;
  hoverImage: string;
}

const TeamCard: React.FC<TeamCardProps> = ({ name, role, defaultImage, hoverImage }) => {
  const [isHovered, setIsHovered] = useState(false);

  return (
    <div
      className={styles.card}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
    >
      <img src={isHovered ? hoverImage : defaultImage} alt={name} className={styles.photo} />
      <h3 className={styles.name}>{name}</h3>
      <p className={styles.role}>{role}</p>
    </div>
  );
};

export default TeamCard;
