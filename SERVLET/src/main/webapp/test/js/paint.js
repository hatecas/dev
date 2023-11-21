const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
canvas.width = 1170;
canvas.height = 810;
canvas.style.width = "1170px";
canvas.style.height = "810px";

let painting = false;
let delete_mode = false;
let eraser_mode = false;
let filler_mode=false;
let box_num = 0;

let color1 = "black";
let lastX = 0;
let lastY = 0;
let brushSize = 2.0; // 초기 브러시 크기
let eraserSize =20; // 초기 지우개 크기

brushSize = document.getElementById("brush_range").value;
eraserSize = document.getElementById("eraser_range").value;

// 브러시 버튼 클릭 시
$("#button_brush").on("click", function () {
  eraser_mode = false; // 브러시 모드로 변경
  filler_mode=false;
  canvas.style.cursor = 'url("./image/brush.ico") 10 10, auto';
}); 

// 지우개 버튼 클릭 시
$("#button_eraser").on("click", function () {
  eraser_mode = true;
  filler_mode=false;
  canvas.style.cursor = 'url("./image/eraser.ico") 10 10, auto';
});

$("#button_filler").on("click",function(){
  filler_mode=true;
  eraser_mode=false;
  canvas.style.cursor = 'url("./image/filler.ico") 10 10, auto';
})


$("#canvas").on("mousedown", function () {
  if (eraser_mode) {
    ctx.globalCompositeOperation = "destination-out"; // 지우개 효과를 위한 설정
    ctx.strokeStyle = "rgba(255, 255, 255, 1)"; // 흰색으로 설정
    ctx.lineWidth = document.getElementById("eraser_range").value; // 지우개 크기로 설정
  } else if(filler_mode){
    ctx.fillStyle=color1;
    ctx.fillRect(0,0,1170,810);
  } else {
    ctx.globalCompositeOperation = "source-over"; // 그리기 모드로 설정
    ctx.strokeStyle = color1; // 이전 색상으로 설정
    ctx.lineWidth = document.getElementById("brush_range").value; // 현재 크기로 설정 (브러시 크기 또는 지우개 크기)
  }
});

// 캔버스에서 마우스 이벤트 발생 후 모드 초기화
$("#canvas").on("mouseup", function () {
  ctx.globalCompositeOperation = "source-over"; // 그리기 모드로 설정
  ctx.strokeStyle = color1; // 이전 색상으로 설정

});

$("#canvas").on("mouseleave", function () {
  // 캔버스를 떠날 때도 모드 초기화
  ctx.globalCompositeOperation = "source-over"; // 그리기 모드로 설정
  ctx.strokeStyle = color1; // 이전 색상으로 설정
  
});

function stopPainting() {
  painting = false;
  ctx.beginPath(); // 마우스를 떼면 현재 경로를 끊습니다.
}

function startPainting() {
  painting = true;
}

function onMouseMove(event) {
  const x = event.offsetX;
  const y = event.offsetY;

  if (!painting) return;

  ctx.strokeStyle = color1;
  ctx.lineJoin = "round";
  ctx.lineCap = "round";

  // 이전 점과 현재 점을 연결하여 선을 그립니다.
  ctx.beginPath();
  ctx.moveTo(lastX, lastY);
  ctx.lineTo(x, y);
  ctx.stroke();

  lastX = x;
  lastY = y;
}

function onMouseDown(event) {
  startPainting();
  lastX = event.offsetX;
  lastY = event.offsetY;
}

function onMouseUp(event) {
  stopPainting();
}

if (canvas) {
  canvas.addEventListener("mousemove", onMouseMove);
  canvas.addEventListener("mousedown", onMouseDown);
  canvas.addEventListener("mouseup", onMouseUp);
  canvas.addEventListener("mouseleave", stopPainting);
}

const colorInput = document.getElementById("color");

colorInput.addEventListener("input", (event) => {
  color1 = event.target.value;
});

/////////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function () {
 
  $("#create").on("click", function () {
    let box_width = $("#box_width").val();
    let box_height = $("#box_height").val();
    let box_radius = $("#box_radius").val();
    let box_color = $("#color").val();

    let newBox = $("<div>", {
      id: "box" + box_num,
      class: "draggable-box",
      css: {
        width: box_width + "px",
        height: box_height + "px",
        "border-radius": box_radius + "px",
        background: box_color,
        position: "absolute",
        top: 450,
        left: 1100,
      },
    });

    newBox.appendTo("#paper");

    newBox.draggable();

    box_num++;
  });

  $("#delete").on("click", function () {
    delete_mode = !delete_mode;

    if (delete_mode) {
      $(this).addClass("active");
    } else {
      $(this).removeClass("active");
    }
  });

  $("#paper").on("click", ".draggable-box,.draggable-image", function () {
    if (delete_mode) {
      $(this).remove();
      delete_mode = false;
      $("#delete").removeClass("active");
    }
  });

  $("#upload").on("change", function (e) {
    let box_width = $("#box_width").val();
    let box_height = $("#box_height").val();
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function (event) {
        const imageUrl = event.target.result;
        // 이미지를 표시
        const image = $("<img>", {
          id: "image" + box_num,
          class: "draggable-image",
          border: "none",
          width: box_width,
          height: box_height,
          src: imageUrl,
        });
        image.appendTo("#paper");
        // 이미지를 드래그 가능하게 만듭니다.
        image.draggable();
        box_num++;
      };
      reader.readAsDataURL(file);
    }
  });
});

$(document).on("keyup", function (event) {
  if (event.keyCode === 13) {
    $("#create").click();
  } else if (event.keyCode === 46) {
    $("#delete").click();
  }
});
