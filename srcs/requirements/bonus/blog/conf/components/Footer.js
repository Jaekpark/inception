import styles from "../styles/footer.module.css";

export default function Footer() {
	return (
		<div
			className={styles.footer}
		>
			© jaekpark.42.fr {new Date().getFullYear()}
		</div>
	);
}
