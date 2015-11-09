/***
 * per window.jQuery
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js" ></script>
 * o
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js" ></script>
 *
 *
 * per window.Q
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/q.js/1.4.1/q.js" ></script>
 * o
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/q.js/1.4.1/q.min.js
 *
 * per window._
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.0/lodash.js"></script>
 * o
 * <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.0/lodash.min.js"></script>
 */
(function($, Q, _) {

    //window.dropbox = new Dropbox('****************', '****************');

    function Dropbox(client_id, client_secret) {

        var access = {};
        if (!_.isEmpty(client_id)) {
            access.client_id = client_id;
        }
        if (!_.isEmpty(client_secret)) {
            access.client_secret = client_secret;
        }
        if (localStorage.access !== undefined && localStorage.access !== 'undefined') {
            console.log(localStorage.access);
            access = JSON.parse(localStorage.access);
        }

        return {
            access: access,
            userInfo: userInfo,
            getAccessCode: getAccessCode,
            getAuth: getAuth,
            getFile: getFile,
            files: listFiles,
            putFile: putFile
        };

        function listFiles() {
            var def = Q.defer();
            var url = 'https://api.dropboxapi.com/1/metadata/auto/';
            $.ajax({
                method: 'GET',
                url: url,
                dataType: "JSON",
                data: {
                    list: true
                },
                beforeSend: function(request) {
                    request.setRequestHeader("Authorization", 'Bearer ' + access.access_token);
                }
            }).then(function(res) {
                def.resolve(res);
            }).fail(function(res, a, b) {
                def.reject(res);
            });
            return def.promise;
        }

        function getFile(content) {
            var def = Q.defer();
            var url = 'https://content.dropboxapi.com/1/files/auto/';
            $.ajax({
                type: 'GET',
                url: url + content.path,
                beforeSend: function(request) {
                    request.setRequestHeader("Authorization", 'Bearer ' + access.access_token);
                    request.setRequestHeader("Accept", content.mime_type);
                }
            }).then(function(res) {
                def.resolve(res);
            }).fail(function(res) {
                console.error(res);
                def.reject(res);
            });

            return def.promise;
        }

        function putFile(file) {
            var defer = Q.defer();
            var url = 'https://content.dropboxapi.com/1/files_put/auto/';
            console.log(file);
            console.log(file[0].value);
            var filepath = file[0].value;
            var filename = filepath.replace(/^.*?([^\\\/]*)$/, '$1');
            url += filename;
            var fd = new FormData();
            fd.append('file', file[0].files[0], filename);
            $.ajax({
                    type: 'PUT',
                    url: url,
                    data: fd,
                    processData: false,
                    contentType: false,
                    beforeSend: function(request) {
                        request.setRequestHeader("Authorization", 'Bearer ' + access.access_token);
                    }
                })
                .then(function(res) {
                    console.log(res);
                    defer.resolve(res);
                })
                .fail(function(res) {
                    console.error(res);
                    defer.reject(res);
                });
            return def.promise;
        }


        function getAccessCode() {
            var url = 'https://www.dropbox.com/1/oauth2/authorize';
            window.open(url + '/?client_id=' + access.client_id + '&response_type=code');
        }

        function getAuth() {
            var def = Q.defer();
            var url = 'https://api.dropboxapi.com/1/oauth2/token';
            $.ajax({
                type: 'POST',
                url: url,
                data: "code=" + access.code + '&grant_type=authorization_code&client_id=' + access.client_id + '&client_secret=' + access.client_secret,
                beforeSend: function(request) {
                    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                }
            }).then(function(res) {
                _.merge(access, res.data);
                localStorage.access = JSON.stringify(access);
                def.resolve(true);
            }).fail(function(res) {
                console.error(res);
                def.reject(res);
            });
            return def.promise;
        }

        function userInfo() {
            var def = Q.defer();
            var url = 'https://api.dropboxapi.com/1/account/info';
            $.ajax({
                type: 'GET',
                url: url,
                dataType: 'JSON',
                beforeSend: function(request) {
                    request.setRequestHeader("Authorization", 'Bearer ' + access.access_token);
                }
            }).then(function(res) {
                def.resolve(res);
            }).fail(function(res) {
                console.error(res);
                def.reject(res);
            });

            return def.promise;
        }
    }

})(window.jQuery, window.Q, window._);
