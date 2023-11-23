<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-size: cover;
            transition: background-image 1s ease-in-out;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
        }

        #content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #content {
            margin-top: 10%;
            margin-bottom: 20px;
            width: 500px;
            height: 160px;
            margin-left: auto;
            margin-right: auto;
        }

        #txt {
            text-align: center;
            width: 500px;
            height: 80px;
            font-size: large;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>노래 맞추기 게임</title>

</head>

<body id="background">

    <div id="content-container">
        <div id="content">
            <textarea readonly
                style="resize: none; border: none; width: 500px; height: 160px; font-size: 20px; overflow: hidden;">
            기능소개

1.스페이스바를 누르면 일시정지 및 재생
2.엔터키를 누르면 확인 버튼
3.확인 버튼을 누르면 정답 확인 후 2초 후에 자동으로 다음곡 재생
            </textarea>
        </div>

        <div>
            <input id="txt" type="text" readonly value="">
        </div>

        <div>
            <audio controls="controls" id="audio_player" autoplay="true">
                노래
            </audio>
        </div>

        <div>
            <input type="text" id="answer" placeholder="정답" autofocus="true">
            <button id="someButton" onclick="playNextSong()">확인</button>
        </div>
    </div>

    <script>
        var playlist = [
        	{ fileName: "song1.mp3", title: "북두칠성", hint:"남자솔로,2015"},
    		{ fileName: "song2.mp3", title: "좋은날", hint:"여자솔로, 3단고음"},
    		{ fileName: "song3.mp3", title: "oh", hint:"걸그룹, 영어제목"},
    		{ fileName: "song4.mp3", title: "메테오", hint:"남자솔로, 한글제목"},
    		{ fileName: "song5.mp3", title: "벌써일년", hint:"2001, 나얼"},
    		{ fileName: "song6.mp3", title: "이미슬픈사랑", hint:"1999, 고음"},
    		{ fileName: "song7.mp3", title: "촛불하나", hint:"보이그룹, 지치고 힘들땐"},
    		{ fileName: "song8.mp3", title: "까만안경", hint:"AI랄로"},
    		{ fileName: "song9.mp3", title: "Y", hint:"싸이월드, 영어제목"},
    		{ fileName: "song10.mp3", title: "가시", hint:"쌈자"},
    		{ fileName: "song11.mp3", title: "낙원", hint:"2글자 제목"},
    		{ fileName: "song12.mp3", title: "너에게쓰는편지", hint:"발치, 듀엣"},
    		{ fileName: "song13.mp3", title: "그녀를찾아주세요", hint:"이름 ,2008"},
    		{ fileName: "song14.mp3", title: "너의번호를누르고", hint:"전화번호"},
    		{ fileName: "song15.mp3", title: "사랑에연습이있었다면", hint:"사재기 논란"},
    		{ fileName: "song16.mp3", title: "내사람", hint:"소몰이"},
    		{ fileName: "song17.mp3", title: "Ibelieve", hint:"2001, 영어제목"},
    		{ fileName: "song18.mp3", title: "거리에서", hint:"잘자요"},
    		{ fileName: "song19.mp3", title: "바람기억", hint:"미쳐버린 고음, 노래방차트"},
    		{ fileName: "song20.mp3", title: "해바라기", hint:"꽃 이름"},
    		{ fileName: "song21.mp3", title: "사랑해그리고기억해", hint:"보이그룹, 9글자제목"},
    		{ fileName: "song22.mp3", title: "hello", hint:"슈스케2, 영어제목"},
    		{ fileName: "song23.mp3", title: "형", hint:"자살방지곡"},
    		{ fileName: "song24.mp3", title: "챔피언", hint:"2002 월드컵, 한글제목"},
    		{ fileName: "song25.mp3", title: "비행기", hint:"2006, 고인이 된 래퍼"},
        ];

        function delayPrint(message, delay) {
            return new Promise(resolve => {
                setTimeout(() => {
                    console.log(message);
                    resolve();
                }, delay);
            });
        }

        var playedSongs = [];
        var index;
        var selected_Song;

        let nowSong;
        let playlistCopy = [...playlist];
        let score = 0;

        async function printSequentially() {
            let txt = document.getElementById("txt");
            await delayPrint(txt.value = "노래 제목만 맞추는 게임입니다.", 2000);
            await delayPrint(txt.value = "Spacebar를 누르면 재생,일시정지입니다.", 2000);
            await delayPrint(txt.value = "Enter를 누르면 확인 버튼이 눌러집니다.", 2000);
            await delayPrint(txt.value = "띄어쓰기는 생략하고 전부 붙이면 됩니다.", 2000);
            await delayPrint(txt.value = "3", 1000);
            await delayPrint(txt.value = "2", 1000);
            await delayPrint(txt.value = "1", 1000);
            await delayPrint(txt.value = "", 1);
            shufflePlaylist();
            playNextSong();
            set_score();
            document.getElementById("txt").value = nowSong.hint;
        }

        function next() {
            document.getElementById("txt").value = "";
            document.getElementById("answer").value = "";
            playNextSong();
            set_score();
            document.getElementById("txt").value = nowSong.hint;
        }

        function shufflePlaylist() {
            playlistCopy = playlistCopy.sort(() => Math.random() - 0.5);
        }

        document.getElementById("someButton").addEventListener("click", playNextSong);

        async function playNextSong() {
            if (playlistCopy.length > 0) {
                nowSong = playlistCopy.pop(); // 플레이리스트에서 마지막 노래를 가져옴
                let audio_player = document.getElementById("audio_player");
                audio_player.setAttribute("src", "http://localhost/jsp/song/" + nowSong.fileName);
                await audio_player.play();
            } else {
                document.getElementById("txt").value = "당신의 점수는 " + score + "점 입니다!";
                if (score > 6) {
                    setTimeout(() => document.getElementById("txt").value = "왕년에 노래방좀 다니셨나봐요", 2000);
                } else if (score < 3) {
                    setTimeout(() => document.getElementById("txt").value = "노래를 잘 안들으시나봐용", 2000);
                }
                playedSongs = [];
                playlistCopy = [...playlist]; // 플레이리스트를 초기 상태로 리셋
            }
        }

        function calculateLevenshteinDistance(a, b) {
            if (a.length === 0) return b.length;
            if (b.length === 0) return a.length;

            const matrix = [];

            for (let i = 0; i <= b.length; i++) {
                matrix[i] = [i];
            }

            for (let j = 0; j <= a.length; j++) {
                matrix[0][j] = j;
            }

            for (let i = 1; i <= b.length; i++) {
                for (let j = 1; j <= a.length; j++) {
                    const cost = a[j - 1] === b[i - 1] ? 0 : 1;
                    matrix[i][j] = Math.min(
                        matrix[i - 1][j] + 1,
                        matrix[i][j - 1] + 1,
                        matrix[i - 1][j - 1] + cost
                    );
                }
            }

            return matrix[b.length][a.length];
        }

        function check() {
            let answer_user = document.getElementById("answer").value.replace(/\s/g, '').toLowerCase();
            let answer_computer = nowSong.title.replace(/\s/g, '').toLowerCase();


            // 레벤슈타인 거리 기준 설정 (예: 3 이하면 유사하다고 판단)
            const similarityThreshold = 3;

            const distance = calculateLevenshteinDistance(answer_user, answer_computer);

            let text = document.getElementById("txt");

            if (answer_user === "") {
                text.value = "오답입니다. \n정답은 " + answer_computer + "였습니다.";
                setTimeout(() => next(), 2000);
            } else if (distance <= similarityThreshold) {
                text.value = "정답입니다";
                score++;
                setTimeout(() => next(), 2000);
            } else {
                text.value = "오답입니다. \n정답은 " + answer_computer + "였습니다.";
                setTimeout(() => next(), 2000);
            }
        }

        document.getElementById("answer").addEventListener("keydown", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                check();
            }
        });

        document.addEventListener("keydown", function(event) {
            if (event.code === "Space") {  // event.code를 사용하여 더 나은 호환성을 위해 수정
                event.preventDefault();
                let audio_player = document.getElementById("audio_player");
                if (audio_player.paused) {
                    audio_player.play();
                } else {
                    audio_player.pause();
                }
            }
        });

        function set_score() {
            let scoreboard = document.getElementById("scoreboard");
            if (scoreboard) {
                scoreboard.value = "Score: " + score;
            }
        }

        // 추가된 부분: 배경 이미지 변경
        var backgroundImages = [
            'http://192.168.200.128/song/background1.jpg',
            'http://192.168.200.128/song/background2.jpg'
            // 추가할 배경 이미지 경로들을 여기에 추가하세요
        ];

        var currentBackgroundIndex = 0;

        function changeBackground() {
            var background = document.getElementById('background');
            currentBackgroundIndex = (currentBackgroundIndex + 1) % backgroundImages.length;
            background.style.backgroundImage = backgroundImages[currentBackgroundIndex];
        }

        window.onload = function () {
            setInterval(changeBackground, 5000);
            printSequentially();  // 기존의 함수 호출도 유지
        };

    </script>
</body>

</html>
