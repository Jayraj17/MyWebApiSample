<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Controller.aspx.cs" Inherits="Practice2017.Practice.Controller" %>

<!DOCTYPE html>


<html ng-app="myApp">
<head runat="server">
    <title></title>
    <script src="../Script/angular.min.js"></script>
    <script src="../Script/CommonAngular.js"></script>


</head>

<body>
    <form id="form1" runat="server">
        <div ng-controller="MyDemo">
            {{ Message }}
        </div>
        <div ng-controller="MyDemo2">
            {{Msg}}
        </div>
        <hr />
        <div ng-controller="Cnlr_EmpInfo">
            <table>
                <tr>
                    <td>Name :- </td>
                    <td>{{EmpName}}
                    </td>
                </tr>
                <tr>
                    <td>Mobile :- </td>
                    <td>{{EmpMobile}}
                    </td>
                </tr>

                <tr>
                    <td>Address :- </td>
                    <td>{{EmpAdd}}
                    </td>
                </tr>


            </table>





        </div>
        <hr />

        <div ng-controller="Cnlr_FillEmpInfo">
            First Name:
            <input type="text" ng-model="firstName"><br>
            Last Name:
            <input type="text" ng-model="lastName"><br>
            <br>
            Full Name: {{fullName()}}
        </div>


    </form>
</body>
</html>

