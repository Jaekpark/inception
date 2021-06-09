import Layout from "../components/Layout";
import Container from "../components/Container";

import styles from "../styles/about.module.css";

export default function About() {
	return (
		<Layout>
			<Container
				pageHeight
				size="md"
			>
				<div className={styles.wrapper}>
					<h1>About</h1>
					<div className={styles.presentation}>
						<div>
							<h3>안녕하세요</h3>
							<p>
								jaekpark's blog에 오신걸 환영합니다.
							</p>
							<p>
								이 블로그는 42서울 과제 정리용 블로그 입니다.
							</p>
						</div>
						<div className={styles.contact}>
							<h3>Contact</h3>
							<div>
								<a href="mailto:">
									<span className={styles.actualEmail}>
										jaekpark@student.42seoul.kr
									</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</Container>
		</Layout>
);
}
