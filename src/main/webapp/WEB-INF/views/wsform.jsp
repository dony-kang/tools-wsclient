<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
        crossorigin="anonymous"></script>
</head>

<body>
    <h1>Web Service 요청 양식입니다.</h1>

    <div>
        <table>
            <tr>
                <td>
                    반복횟수 :  <input type="number" name="cnt" id="cnt"> <input type="button" value="   요  청   " id="btn_submit">
                </td>
            </tr>
            <tr>
                <td>
                    요청 Data 입력 부분 : <br>
                    <textarea cols="100" rows="20" name="content" id="content">여기에 XML(SOAP)이나 JSON Data를 입력해 주세요.</textarea>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <b>설명</b><p>
            TextArea 영역에 입력한 데이터를 반복 횟수만큼 복제되어 요청을 전달(Post)한다.
    </div>

    <script>
        $().ready(
            () => {
                $("#btn_submit").click(
                    e => {
                        let content = copyData();
                        if(content) ajaxRequest(content);
                    }
                );
               
                $("#content").focus(
                    () => {
                        if ($("#content").val().match("^여기")) $("#content").val("");
                    }
                );
            }
        );

        function copyData() {
            let org_data = $("#content").val();
            if(!org_data) return false;

            let cnt = $("#cnt").val();
            let size = $.isNumeric(cnt) ? cnt : 1;

            let duplicatedData = [];
            for (var i = 1; i <= size; i++) {
                duplicatedData.push(org_data);
            }

            return duplicatedData;
        }

        function ajaxRequest(p_content) {
            let fmtData = { "info": p_content };

            $.ajax({
                type: "POST",
                // url : "http://10.10.8.5:8090/testRest",
                url: "http://localhost:8000/testRest.do",
                data: JSON.stringify(fmtData),
                contentType: 'application/json; charset=UTF-8',
                success: function (resp) {
                    console.log("submited......");
                }
            });
        }
    </script>
</body>

</html>