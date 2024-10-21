<template>
    <div>
        <div v-clickoutside="hideReplyBtn" @click="inputFocus" class="my-reply">
            <el-avatar class="header-img" :size="40" :src="myHeader"></el-avatar>
            <div class="reply-info">
                <div
                tabindex="0"
                contenteditable="true"
                id="replyInput"
                spellcheck="false"
                placeholder="Type here..."
                class="reply-input"
                @focus="showReplyBtn"
                @input="onDivInput($event)"
                >
                </div>
            </div>
            <div class="reply-btn-box" v-show="btnShow">
                <el-button class="reply-btn" size="medium" @click="sendComment" type="primary">Upload</el-button>
            </div>
        </div>
        <div v-for="(item, i) in comments" :key="i" class="author-title reply-father">
            <el-avatar class="header-img" :size="40" :src="item.headImg"></el-avatar>
            <div class="author-info">
                <span class="author-name">{{item.name}}</span>
                <span class="author-time">{{item.time}}</span>
            </div>
            <div class="icon-btn">
                <span @click="showReplyInput(i, item.name, item.id)"><i class="iconfont el-icon-s-comment"></i>{{item.commentNum}}<svg  t="1728713313815" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5397" width="15" height="15"><path d="M720.398507 959.573333c73.045333 31.317333 136.96-15.317333 129.706666-94.293333l-20.650666-226.218667 174.634666-199.722666c38.144-43.648 19.2-102.229333-37.418666-115.114667l-258.474667-58.794667-135.68-228.010666c-29.738667-49.877333-91.306667-49.92-121.045333 0L315.74784 265.429333 57.273173 324.224C0.953173 337.066667-18.33216 395.648 19.854507 439.338667l174.634666 199.722666-24.021333 264.405334c-5.248 57.770667 44.544 94.037333 97.877333 71.125333l243.626667-104.533333 208.426667 89.472z" fill="#3D3D3D" p-id="5398"></path></svg></span>
                <i class="iconfont el-icon-caret-top"></i>{{item.like}}<svg  t="1728712557733" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4247" width="15" height="15">
                <path d="M512 901.746939c-13.583673 0-26.122449-4.179592-37.093878-13.061225-8.881633-7.314286-225.697959-175.020408-312.424489-311.379592C133.746939 532.37551 94.040816 471.24898 94.040816 384.522449c0-144.718367 108.146939-262.269388 240.326531-262.269388 67.395918 0 131.657143 30.82449 177.632653 84.636735 45.453061-54.334694 109.191837-84.636735 177.110204-84.636735 132.702041 0 240.326531 117.55102 240.326531 262.269388 0 85.159184-37.093878 143.673469-67.395919 191.216327l-1.044898 1.567346c-86.726531 136.359184-303.542857 304.587755-312.424489 311.379592-10.44898 8.359184-22.987755 13.061224-36.571429 13.061225z" fill="#E5404F" p-id="4248"></path>
              </svg>
            </div>
            <div class="talk-box">
                <p>
                    <span class="reply">{{item.comment}}</span>
                </p>
            </div>
            <div class="reply-box">
                <div v-for="(reply, j) in item.reply" :key="j" class="author-title">
                    <el-avatar class="header-img" :size="40" :src="reply.fromHeadImg"></el-avatar>
                    <div class="author-info">
                        <span class="author-name">{{reply.from}}</span>
                        <span class="author-time">{{reply.time}}</span>
                    </div>
                    <div class="icon-btn">
                        <span @click="showReplyInput(i, reply.from, reply.id)"><i class="iconfont el-icon-s-comment"></i>{{reply.commentNum}}<svg  t="1728713313815" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5397" width="15" height="15"><path d="M720.398507 959.573333c73.045333 31.317333 136.96-15.317333 129.706666-94.293333l-20.650666-226.218667 174.634666-199.722666c38.144-43.648 19.2-102.229333-37.418666-115.114667l-258.474667-58.794667-135.68-228.010666c-29.738667-49.877333-91.306667-49.92-121.045333 0L315.74784 265.429333 57.273173 324.224C0.953173 337.066667-18.33216 395.648 19.854507 439.338667l174.634666 199.722666-24.021333 264.405334c-5.248 57.770667 44.544 94.037333 97.877333 71.125333l243.626667-104.533333 208.426667 89.472z" fill="#3D3D3D" p-id="5398"></path></svg>
                        </span>
                        <i class="iconfont el-icon-caret-top"></i>{{reply.like}}            <svg  t="1728712557733" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4247" width="15" height="15">
                <path d="M512 901.746939c-13.583673 0-26.122449-4.179592-37.093878-13.061225-8.881633-7.314286-225.697959-175.020408-312.424489-311.379592C133.746939 532.37551 94.040816 471.24898 94.040816 384.522449c0-144.718367 108.146939-262.269388 240.326531-262.269388 67.395918 0 131.657143 30.82449 177.632653 84.636735 45.453061-54.334694 109.191837-84.636735 177.110204-84.636735 132.702041 0 240.326531 117.55102 240.326531 262.269388 0 85.159184-37.093878 143.673469-67.395919 191.216327l-1.044898 1.567346c-86.726531 136.359184-303.542857 304.587755-312.424489 311.379592-10.44898 8.359184-22.987755 13.061224-36.571429 13.061225z" fill="#E5404F" p-id="4248"></path>
              </svg>
                    </div>
                    <div class="talk-box">
                        <p>
                            <span>Reply to {{reply.to}}:</span>
                            <span class="reply">{{reply.comment}}</span>
                        </p>
                    </div>
                </div>
            </div>
            <div v-show="_inputShow(i)" class="my-reply my-comment-reply">
                <el-avatar class="header-img" :size="40" :src="myHeader"></el-avatar>
                <div class="reply-info">
                    <div tabindex="0" contenteditable="true" spellcheck="false" placeholder="Type here..." @input="onDivInput($event)" class="reply-input reply-comment-input"></div>
                </div>
                <div class="reply-btn-box">
                    <el-button class="reply-btn" size="medium" @click="sendCommentReply(i)" type="primary">Upload</el-button>
                </div>
            </div>
        </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  const clickoutside = {
      bind(el, binding) {
          function documentHandler(e) {
              if (el.contains(e.target)) {
                  return false;
              }
              if (binding.expression) {
                  binding.value(e);
              }
          }
          el.vueClickOutside = documentHandler;
          document.addEventListener('click', documentHandler);
      },
      unbind(el) {
          document.removeEventListener('click', el.vueClickOutside);
          delete el.vueClickOutside;
      },
  };
  
  export default {
      name: 'ArticleComment',
      data() {
          return {
              btnShow: false,
              replyComment: '',
              myName: localStorage.getItem('username'),
              myHeader: '', // 初始化为空，稍后从login表中获取
              comments: [
  {
    "name": "Jane",
    "id": 19870621,
    "headImg": "https://www.rgm.com.au/sbd/wp-content/uploads/2019/04/Hall-Jane.jpg",
    "comment": "I’ve lived in Brisbane for over 15 years, and Norman Hotel is hands down my favorite spot for a steak! The vibe is always lively, and the steaks are consistently cooked to perfection. If you're a meat lover, this place is a must-visit.",
    "time": "23/09/2024 18:43",
    "commentNum": 2,
    "like": 15,
    "inputShow": false,
    "reply": [
      {
        "from": "Sigma",
        "fromId": 19891221,
        "fromHeadImg": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEkvxcM3syw7oAfIPy5y6EDrVLbYiYUfEnQw&s",
        "to": "Jane",
        "toId": 19870621,
        "comment": "Totally agree! I went there last weekend, and the ribeye was to die for. Perfectly seasoned and tender. Can’t wait to go back!",
        "time": "11/10/2024 18:43",
        "commentNum": 1,
        "like": 15,
        "inputShow": false
      },
      {
        "from": "Ariana",
        "fromId": 1123,
        "fromHeadImg": "https://ae01.alicdn.com/kf/Hf6c0b4a7428b4edf866a9fbab75568e6U.jpg",
        "to": "Jane",
        "toId": 19870621,
        "comment": "I’ve been hearing a lot about Norman Hotel’s steaks. I just moved to Brisbane and I’m definitely adding it to my must-try list. Thanks for the recommendation!",
        "time": "12/10/2024 18:43",
        "commentNum": 0,
        "like": 5,
        "inputShow": false
      }
    ]
  },
  {
    "name": "Nina7",
    "id": 19891221,
    "headImg": "https://media.istockphoto.com/id/1384357158/photo/portrait-of-a-beautiful-mexican-woman.jpg?s=612x612&w=0&k=20&c=OtFYs_rdWIm6JJZxAanK6f0pV-YMfMr1IXUAHUCRfss=",
    "comment": "I’m from Sydney, and every time I come to Brisbane to visit my daughter, Norman Hotel is always my top choice for dinner. The steaks here are simply unbeatable! It’s become a tradition for us to enjoy a meal here together whenever I’m in town. The quality is consistently excellent, and the friendly service makes me feel right at home.",
    "time": "01/10/2024 18:43",
    "commentNum": 1,
    "like": 5,
    "inputShow": false,
    "reply": [
      {
        "from": "Lana",
        "fromId": 19870621,
        "fromHeadImg": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWtthhftzXst1FP7KrE1nYovEmEIH1L2bZTw&s",
        "to": "Nina7",
        "toId": 19891221,
        "comment": "That’s awesome! I’m a Brisbane local and totally agree—Norman Hotel is the perfect spot for a great meal with family. Glad to hear it’s become a tradition for you!！",
        "time": "10/10/2024 18:43",
        "commentNum": 25,
        "like": 5,
        "inputShow": false
      }
    ]
  },
  {
    "name": "Nickl",
    "id": 20190830,
    "headImg": "https://t4.ftcdn.net/jpg/04/33/17/97/360_F_433179700_htTCGwPpXrTwwuLImhJaX4puNBhs44Vc.jpg",
    "comment": "I’ve been living in Brisbane for over 10 years, and Norman Hotel is my go-to spot whenever I’m craving a perfectly cooked steak. The atmosphere is relaxed, and the service is always top-notch. If you haven’t tried their signature T-bone, you’re missing out!",
    "time": "03/10/2024 18:43",
    "commentNum": 0,
    "like": 5,
    "inputShow": false,
    "reply": []
  }
],
          };
      },
      directives: { clickoutside },
      methods: {
          fetchUserData() {
              // 假设有一个API可以获取用户数据
              axios.get('/api/api/getPersonData', { params: { username: this.myName } })
                  .then(response => {
                      this.myHeader ="http://localhost:3000/api/"+ response.data.img_src; // 从login表中获取用户头像
                      console.log(response.data);
                      console.log(this.myHeader);
                  })
                  .catch(err => {
                      console.error('获取用户数据失败:', err);
                  });
          },
           formatDate(date) {
              const day = String(date.getDate()).padStart(2, '0'); // 日
              const month = String(date.getMonth() + 1).padStart(2, '0'); // 月（注意要加1）
              const year = String(date.getFullYear()).slice(-2); // 年（取后两位）
              const hours = String(date.getHours()).padStart(2, '0'); // 时
              const minutes = String(date.getMinutes()).padStart(2, '0'); // 分
  
              return `${day}/${month}/${year} ${hours}:${minutes}`;
          },
          inputFocus() {
              const replyInput = document.getElementById('replyInput');
              if (replyInput) {
                  replyInput.style.padding = '8px 8px';
                  replyInput.style.border = '2px solid blue';
                  replyInput.focus();
              }
          },
          showReplyBtn() {
              this.btnShow = true;
          },
          hideReplyBtn() {
              this.btnShow = false;
              const replyInput = document.getElementById('replyInput');
              if (replyInput) {
                  replyInput.style.padding = '10px';
                  replyInput.style.border = 'none';
              }
          },
          _inputShow(i) {
              return this.comments[i].inputShow;
          },
          showReplyInput(i, toName, toId) {
              this.comments[i].inputShow = true;
              this.to = toName;
              this.toId = toId;
          },
          sendComment() {
              const newComment = {
                  name: this.myName,
                  id: Date.now(), // 生成一个唯一的ID
                  headImg: this.myHeader, // 使用从login表中获取的头像
                  comment: this.replyComment,
                  time: this.formatDate(new Date()), // 当前时间
                  commentNum: 0,
                  like: 0,
                  reply: []
              };
              this.comments.push(newComment); // 将新评论添加到评论列表
              this.replyComment = ''; // 清空输入框
              this.btnShow = false; // 隐藏按钮
          },
          sendCommentReply(i) {
              const newReply = {
                  from: this.myName,
                  fromId: Date.now(),
                  fromHeadImg: this.myHeader, // 使用从login表中获取的头像
                  to: this.to,
                  toId: this.toId,
                  comment: this.replyComment,
                  time: new Date().toLocaleString(),
                  commentNum: 0,
                  like: 0
              };
              this.comments[i].reply.push(newReply); // 将新回复添加到对应的评论
              this.replyComment = ''; // 清空输入框
              this.comments[i].inputShow = false; // 隐藏输入框
          },
          onDivInput(e) {
              this.replyComment = e.target.innerText;
          },
      },
      mounted() {
          this.fetchUserData(); // 组件挂载时获取用户数据
      }
  };
  </script>
  
  
  
  
  <style lang="scss" scoped>
  .my-reply {
    padding: 10px;
    background-color: #fafbfc;
    .header-img {
      display: inline-block;
      vertical-align: top;
    }
  
    .reply-info {
      display: inline-block;
      margin-left: 5px;
      width: 90%;
      @media screen and (max-width: 1200px) {
        width: 80%;
      }
      .reply-input {
        min-height: 20px;
        line-height: 22px;
        padding: 10px 10px;
        color: #ccc;
        background-color: #fff;
        border-radius: 5px;
        &:empty:before {
          content: attr(placeholder);
        }
        &:focus:before {
          content: none;
        }
        &:focus {
          padding: 8px 8px;
          border: 2px solid blue;
          box-shadow: none;
          outline: none;
        }
      }
    }
    .reply-btn-box {
      height: 25px;
      margin: 10px 0;
      .reply-btn {
        position: relative;
        float: right;
        margin-right: 15px;
      }
    }
  }
  .my-comment-reply {
    margin-left: 50px;
    .reply-input {
      width: flex;
    }
  }
  
  .author-title:not(:last-child) {
    border-bottom: 1px solid rgba(178, 186, 194, 0.3);
  }
  
  .author-title {
    padding: 10px;
    .header-img {
      display: inline-block;
      vertical-align: top;
    }
    .author-info {
      display: inline-block;
      margin-left: 5px;
      width: 60%;
      height: 40px;
      line-height: 20px;
      > span {
        display: block;
        cursor: pointer;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
      }
      .author-name {
        color: #000;
        font-size: 18px;
        font-weight: bold;
      }
  
      .author-time {
        font-size: 14px;
      }
    }
    .icon-btn {
      width: 30%;
      padding: 0 !important ;
      float: right;
      @media screen and (max-width: 1200px) {
        width: 20%;
        padding: 7px;
      }
      > span {
        cursor: pointer;
      }
      .iconfont {
        margin: 0 5px;
      }
    }
    .talk-box {
      margin: 0 50px;
      > p {
        margin: 0;
      }
      .reply {
        font-size: 16px;
        color: #000;
      }
    }
    .reply-box {
      margin: 10px 0 0 50px;
      background-color: #efefef;
    }
  }
  </style>