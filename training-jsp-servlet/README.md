# **JSP SERVLET**

## **Technologies :**

---

-   Front End: `JSP`
-   Back End: `Servlet`
-   Build Project: `Maven` thay vì `Dynamic Web`
-   Server: `Apache Tomcat 8.5`
-   Database: `MySql`

## **1. Presentation Layer**

---

### **Tree view**

---

```
- main
	+ java // Controllers, Models
	- resources // Chứa các bundle để sử dụng mà không cần phải zô trang tìm thay đổi
		- db.properties

	- webapp // Views, Configs
		- common // Những cái gì chung giữa các page, taglib
			header.jsp
			footer.jsp
			...
			taglib.jsp // import những taglib để cho các trang khác sử dụng

		- decorators // Định hướng các trang, ở đây chứa page master, 1 cái khung cho các trang chỉ khác nhau về content
			pagemaster.jsp
		+ template // Các resources dùng cho các trang như js, css, bootstrap,...
		+ views // Chứa các trang, ở đây chỉ chứa content các trang vì các phần giống nhau như header, footer đã được tạo trong thư mục common
		- WEB-INF // Chứa các file config như web.xml
			web.xml // Chỉ định file được load đầu tiên khi vào trang web, filter của decorator,...
			decorators.xml // Phân tích prefix của url để điều tới page master phù hợp
			beans.xml // Cái này của Java Servlet Weld dùng để lưu các bean, khi dùng thì chỉ cần khai báo @Inject

		index.jsp

...
pom.xml // Chứa các dependency, build


```

`web.xml`

---

Config

```
<?xml version="1.0" encoding="UTF-8"?>
<web-app
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
						http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	version="3.1"
>

    <!-- tên của project -->
	<display-name>training jsp servlet</display-name>

    <!-- file được chọn để tới đầu tiên -->
	<welcome-file-list>
		<welcome-file>index.jsp</welcome-file>
	</welcome-file-list>

	<!-- dùng cho decorator -->
	<filter>
		<filter-name>sitemesh</filter-name>
		<filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
	</filter>

	<filter-mapping>
		<filter-name>sitemesh</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>

</web-app>
```

`pom.xml`

---

-   Properties

```
Chứa các phiên bản của các dependencies để dể quản lý
```

-   Dependencies

```
-   Jsp API // Dùng cho thằng JSP
-	Servlet API // Dùng cho thằng Servlet
-	JSTL // Là 1 thư viện của Jsp
-	Sitemesh // Chuyển hướng trang
-	MySQL // Khi thao tác với MySQL
-	Servlet Weld // Lưu các đối tượng mà không cần new mới
-	BeanUtils // Lưu các đối tượng được Client trả về và mapping vào 1 Model
-	Commons Lang // Bổ sung 1 số thư viện trong Java

Khi dùng RESTFUL API thì thêm những thư viện:
-	Jackson Core
-	Jackson Core ASL
-	Jackson Databind
-	Jackson Annotations
-	Jackson Mapper ASL

```

-   Build

```
Build môi trường chạy, ở đây dùng thư viện Java 8
```

**Content**

---

```
<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.example</groupId>
	<artifactId>training-jsp-servlet</artifactId>
	<version>1.0</version>
	<packaging>war</packaging>

	<properties>
		<maven.compiler.source>1.8</maven.compiler.source>
		<maven.compiler.target>1.8</maven.compiler.target>
		<jsp.api.version>2.0</jsp.api.version>
		<servlet.api.version>3.1.0</servlet.api.version>
		<jstl.version>1.2</jstl.version>
		<sitemesh.version>2.4.2</sitemesh.version>
		<mysql.version>8.0.16</mysql.version>
		<weld.servlet.version>1.1.0.Final</weld.servlet.version>
		<beanutils.version>1.9.4</beanutils.version>
		<commons.lang.version>2.6</commons.lang.version>
		<jackson.core.version>2.9.8</jackson.core.version>
		<jackson.core.asl.version>1.9.13</jackson.core.asl.version>
		<jackson.databind.version>2.9.8</jackson.databind.version>
		<jackson.annotations.version>2.9.8</jackson.annotations.version>
		<jackson.mapper.asl.version>1.9.13</jackson.mapper.asl.version>
	</properties>

	<dependencies>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jsp-api</artifactId>
			<version>${jsp.api.version}</version>
		</dependency>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>javax.servlet-api</artifactId>
			<version>${servlet.api.version}</version>
		</dependency>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>${jstl.version}</version>
		</dependency>

		<dependency>
			<groupId>opensymphony</groupId>
			<artifactId>sitemesh</artifactId>
			<version>${sitemesh.version}</version>
		</dependency>

		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>${mysql.version}</version>
		</dependency>

		<dependency>
			<groupId>org.jboss.weld.servlet</groupId>
			<artifactId>weld-servlet</artifactId>
			<version>${weld.servlet.version}</version>
		</dependency>

		<dependency>
			<groupId>commons-beanutils</groupId>
			<artifactId>commons-beanutils</artifactId>
			<version>${beanutils.version}</version>
		</dependency>

		<dependency>
			<groupId>commons-lang</groupId>
			<artifactId>commons-lang</artifactId>
			<version>${commons.lang.version}</version>
		</dependency>


		<!-- Json -->

		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-core</artifactId>
			<version>${jackson.core.version}</version>
		</dependency>

		<dependency>
			<groupId>org.codehaus.jackson</groupId>
			<artifactId>jackson-core-asl</artifactId>
			<version>${jackson.core.asl.version}</version>
		</dependency>

		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-databind</artifactId>
			<version>${jackson.databind.version}</version>
		</dependency>

		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-annotations</artifactId>
			<version>${jackson.annotations.version}</version>
		</dependency>

		<dependency>
			<groupId>org.codehaus.jackson</groupId>
			<artifactId>jackson-mapper-asl</artifactId>
			<version>${jackson.mapper.asl.version}</version>
		</dependency>

		<!-- End Json -->

	</dependencies>

	<build>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.6.1</version>
				<configuration>
					<source>1.8</source>
					<target>1.8</target>
				</configuration>

			</plugin>
		</plugins>
	</build>


</project>
```

`taglib.jsp`

---

Chứa các taglib, sau đó chỉ cần `include` file `taglib.jsp` rồi sử dụng

import library: dependency trong file pom.xml

import voi `uri` la `http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"` de su dung, `prefix` = gi cung duoc de su dung

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

```
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
```

decorators: import library > build template > filter

build ra `war` mvn clean install

presentation layer > business logic > data access layer

presentation layer : mvc

business logic: xu ly logic

data access layer: thao tac voi db

SOLID

D: Dependency invertion

JSW - java servlet weld: dung de quan ly cac doi tuong
khai bao 1 file beans.xml, de ko phai khoi tao moi khi goi

beans.xml, web.xml

`beans.xml` : chạy ổn định

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://java.sun.com/xml/ns/javaee"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/beans_1_0.xsd"
>

</beans>
```

trong `web.xml`

```
<listener>
	<listener-class>org.jboss.weld.environment.servlet.Listener</listener-class>
</listener>
```

Generic
T
Abstract

JDBC cap 1 trans khi them sua xoa xuong db, setAutoCommit(false),

restful api best practices: lam viec voi http method la GET, POST, DELETE, PUT

```
{
	"title": "bài viết số 10",
	"content": "Hello",
	"categoryId": 1
}
```

ko bi loi font khi post: req.setCharacterEncoding("UTF-8");
khi sv xu ly xong tra ve cho client theo kieu du lieu json: resp.setContentType("application/json");

bien json -> string json

string json -> model

luu xuong

model -> json -> tra ve lai

```
import com.fasterxml.jackson.databind.ObjectMapper;

ObjectMapper mapper = new ObjectMapper();
mapper.writeValue(resp.getOutputStream(), newsModel);
```

->

httputil -> mapping json voi model

beanutils maven -> formutil -> mapping form parameter voi model

Servlet filter -> authorization

create packet -> class -> config file web.xml

Dùng AJAX để lấy dữ liệu từ API
