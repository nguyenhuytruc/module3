<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="/display-discount" method="post">
    <label>Product Description: </label><br/>
    <input type="text" name="product_description" placeholder=" Mô tả của sản phẩm"/><br/>
    <label>List Price: </label><br/>
    <input type="text" name="list_price" placeholder=" Giá niêm yết của sản phẩm"/><br/>
    <label>Discount Percent: </label><br/>
    <input type="text" name="discount_percent" placeholder="Tỷ lệ chiết khấu (phần trăm)"/><br/>
    <input type = "submit" id = "submit" value = "Discount Amount"/>
</form>
</body>
</html>