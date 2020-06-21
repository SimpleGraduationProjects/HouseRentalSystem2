function PageTop() {
    var jumpurl = formpage.jumpurl.value;
    var page = parseInt(formpage.page.value);
    if (page <= 1) {
        alert("已至第一页");
    } else {
        url = jumpurl + "pageNumber=1";
        window.location.href = url;

    }
}

function PageLast() {
    var jumpurl = formpage.jumpurl.value;
    var page = parseInt(formpage.page.value);
    var pageCount = parseInt(formpage.pageCount.value);
    if (page >= pageCount) {
        alert("已至最后一页");
    } else {
        if (formpage.pageCount.value == 0) {//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
            url = jumpurl + "pageNumber=1";
            window.location.href = url;

        } else {
            url = jumpurl + "pageNumber=" + formpage.pageCount.value;
            window.location.href = url;

        }
    }
}

//上一页
function PagePre() {
    var jumpurl = formpage.jumpurl.value;
    var page = parseInt(formpage.page.value);
    if (page <= 1) {
        alert("已至第一页");
    } else {
        url = jumpurl + "pageNumber=" + (page - 1);
        window.location.href = url;

    }
}

function PageNext() {
    var jumpurl = formpage.jumpurl.value;
    var page = parseInt(formpage.page.value);
    var pageCount = parseInt(formpage.pageCount.value);
    if (page >= pageCount) {
        alert("已至最后一页");
    } else {
        url = jumpurl + "pageNumber=" + (page + 1);

        window.location.href = url;

    }
}

//****判断是否是Number.
function fIsNumber(sV, sR) {
    var sTmp;
    if (sV.length == 0) {
        return (false);
    }
    for (var i = 0; i < sV.length; i++) {
        sTmp = sV.substring(i, i + 1);
        if (sR.indexOf(sTmp, 0) == -1) {
            return (false);
        }
    }
    return (true);
}