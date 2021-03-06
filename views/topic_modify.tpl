{{template "header"}}
<title>Topic - My Beego Blog</title>
</head>

<body>
    <nav class="navbar navbar-default">
        <div class="container">
            {{template "navbar" .}}
        </div>
    </nav>
    <div class="container">
        <div class="col-md-1"></div>
        <div class="col-md-8">
            <h1>Modify Topic</h1>
            <form method="POST" action="/topic" enctype="multipart/form-data">
                <input type="hidden" name="id" value="{{.Id}}">
                <div class="form-group">
                    <label>title</label>
                    <input type="text" name="title" class="form-control" value="{{.Topic.Title}}">
                </div>
                <label>category</label>
                <div class="row form-group">
                    <div class="col-xs-2">
                        <select class="form-control" name="category">
                            <option>{{.Topic.Category}}</option>
                            {{range .Category}}
                            <option>{{.Title}}</option>
                            {{end}}
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>content</label>
                    <textarea name="content" cols="30" rows="10" class="form-control">{{.Topic.Content}}</textarea>
                </div>
                <div class="form-group">
                    <label>attachment:<a href="/attachment/{{.Topic.Attachment}}"> {{.Topic.Attachment}}</a></label>
                    <input type="file" name="attachment" class="form-control">
                    <input type="hidden" name="oldAttach" value="{{.Topic.Attachment}}">
                </div>
                <button type="submit" class="btn btn-default">Edit</button>
                <div class="pull-right">
                    <button class="btn btn-default" onclick="return backToHome();">Back</button>
                </div>
            </form>
            <script type="text/javascript">
            function backToHome() {
                window.location.href = "/topic";
                return false;
            }
            </script>
        </div>
    </div>
</body>

</html>
