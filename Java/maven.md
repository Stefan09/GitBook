# Maven

## 简介
Maven是一个项目管理工具，将项目抽象成项目对象模型（Project Object Model, POM）进行管理。
开发人员只需做一些简单的配置，就可以批量完成依赖管理、项目构建、报告和文档的生成工作。

根本作用：统一管理

## 安装配置
1. 依赖java环境
2. 同java环境安装，配置PATH
3. maven自身相关配置

## 概念
### 本地仓库
本地存放jar包的位置，多个项目可以共用仓库
### 中央仓库
拉取依赖jar包的地址，maven的中心仓库服务器在国外，所以一般使用国内镜像
### 仓库镜像
国内最常用的当然是阿里镜像：http://maven.aliyun.com/nexus/content/repositories/central


## maven项目结构
`src/main/java` 项目源码

`src/main/resource` 项目资源

`src/test/java` 项目测试源码

`src/test/resource` 项目测试资源

`pom.xml` maven项目配置文件

## 用法详解
### 如何定位一个依赖包
- groupId：组ID
- artifactId：模块ID
- version：版本号

    ```xml
    <dependency>
       <groupId>cn.missbe.web.search</groupId>
       <artifactId>resource-search</artifactId>
       <packaging>jar</packaging>
       <version>1.0-SNAPSHOT</version>
    </dependency>
    ```

### maven支持组织依赖关系
- 传递
- 继承
    
    父子路径继承：
    ```xml
    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
      xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">  
      <parent>  
        <groupId>com.tiantian.mavenTest</groupId>  
        <artifactId>projectA</artifactId>  
        <version>1.0-SNAPSHOT</version>  
      </parent>  
      <modelVersion>4.0.0</modelVersion>  
      <groupId>com.tiantian.mavenTest</groupId>  
      <artifactId>projectB</artifactId>  
      <packaging>jar</packaging>  
      <version>1.0-SNAPSHOT</version>  
    </project>
    ```
    
    非父子路径继承：A B项目同级路径
    ```xml
    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
      xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">  
      <parent>  
        <groupId>com.tiantian.mavenTest</groupId>  
        <artifactId>projectA</artifactId>  
        <version>1.0-SNAPSHOT</version>  
        <relativePath>../projectA/pom.xml</relativePath>  
      </parent>  
      <modelVersion>4.0.0</modelVersion>  
      <groupId>com.tiantian.mavenTest</groupId>  
      <artifactId>projectB</artifactId>  
      <packaging>jar</packaging>  
      <version>1.0-SNAPSHOT</version>  
    </project> 
    ```

- 聚合

    多模块同时构建，不同于继承中子模块定义父模块，相反要在被聚合模块（“大模块”）中定义聚合模块（“小模块”）
    
    父子路径聚合
    ```xml
    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
      xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">  
      <modelVersion>4.0.0</modelVersion>  
      <groupId>com.tiantian.mavenTest</groupId>  
      <artifactId>projectA</artifactId>  
      <version>1.0-SNAPSHOT</version>  
      <packaging>pom</packaging>  
      <modules>  
           <module>projectB</module>  
      </modules>  
    </project>  
    ```
  
    非父子路径聚合
    ```xml
    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
      xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">  
      <modelVersion>4.0.0</modelVersion>  
       
      <groupId>com.tiantian.mavenTest</groupId>  
      <artifactId>projectA</artifactId>  
      <version>1.0-SNAPSHOT</version>  
      <packaging>pom</packaging>  
      <modules>  
           <module>../projectB</module>  
      </modules>  
    </project>  
    ```
- 总结

    配置继承和聚合，父子无需关注路径可直接配置，非父子路径需在 `relativePath` 或 `module` 字段中关注相对路径
   

## 参考资料
[https://blog.csdn.net/lovequanquqn/article/details/81627807](https://blog.csdn.net/lovequanquqn/article/details/81627807)

[https://www.cnblogs.com/wkrbky/p/6353285.html](https://www.cnblogs.com/wkrbky/p/6353285.html)