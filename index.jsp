<!-- # 헤더, 컨테이너, 푸터 순서로 레이아웃이 구성되어 있고

# 헤더에 있는 네비게이션을 통해서 내소개 / 나의 좌우명 / 나의 깃허브나 노션 링크 
# 컨테이너만 바뀌게 

# 푸터에는 이름, 이메일, 깃허브링크, 인스타 등 화면이 바뀌어도 계속 고정되어 있는 무언가를 작성해주세요
# css가 길어지면 별도의 css파일을 만드셔서 <head>에 링크합니다. -->
<%@ page import="model.domain.Student"%> <!--  필요한 패키지가 있다면 import 명령어를 사용해서 가져옵니다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%> <!--   import="model.domain.Student" 하나의 지시어에 다 넣어도 괜찮음 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
    
            header {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
            }
    
            nav {
                display: flex;
                justify-content: space-around;
                background-color: #ddd;
                padding: 10px;
            }
    
            .tab-content {
                display: none;
                padding: 20px;
            }
    
            footer {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 10px;
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>
    <body>
    
        <%@ include file="header.jsp" %>
        <%@ include file="main.jsp" %>
        <%@ include file="footer.jsp" %>
        <script>
            function showTab(tabId) {
                // 모든 탭 숨기기
                var tabContents = document.querySelectorAll('.tab-content');
                tabContents.forEach(function(content) {
                    content.style.display = 'none';
                });
    
                // 선택한 탭 보이기
                var selectedTab = document.getElementById(tabId);
                selectedTab.style.display = 'block';
            }
    
            function loadExternalPage(url, tabId) {
                // 외부 페이지 가져오기
                fetch(url)
                    .then(response => response.text())
                    .then(data => {
                        // 가져온 내용을 해당 탭에 출력
                        var selectedTab = document.getElementById(tabId);
                        selectedTab.innerHTML = data;
                        showTab(tabId);
                    })
                    .catch(error => console.error('Error fetching external page:', error));
            }
        </script>
    
    </body>
    </html>
    