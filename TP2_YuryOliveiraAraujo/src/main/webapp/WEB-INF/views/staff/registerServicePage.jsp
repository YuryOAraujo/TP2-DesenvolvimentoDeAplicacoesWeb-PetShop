<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar serviço</title>
<jsp:include page="navbar.jsp"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script>
    $(document).ready(function () {
        $("#price").mask("#,##0.00", { reverse: true });
    });
</script>
</head>
<body>
	<div class="container">
        <h2 class="mb-4 py-3">Cadastrar serviço</h2>
        <form action="registerService" method="post">
            <div class="form-group">
                <label for="name">Nome:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="price">Valor:</label>
                <input type="text" id="price" name="price" class="form-control" required>
            </div>
            
            <div class="text-center">
                <input type="submit" value="Cadastrar" class="btn btn-info my-3">
            </div>
        </form>
    </div>
</body>
</html>