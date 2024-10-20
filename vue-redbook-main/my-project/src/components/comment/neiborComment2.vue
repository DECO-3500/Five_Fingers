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
    "name": "Lan",
    "id": 19870621,
    "headImg": "https://qph.cf2.quoracdn.net/main-qimg-8ec4eb99173466f86f41555383217d4d.webp",
    "comment": "As an Italian, I was skeptical about finding gelato that would remind me of home, but Messina Gelato blew me away! The texture and flavors are just like what I used to have growing up in Italy. The pistachio flavor is a must-try—it’s so authentic, it took me right back to Sicily!",
    "time": "14/10/2024 18:43",
    "commentNum": 2,
    "like": 15,
    "inputShow": false,
    "reply": [
      {
        "from": "Taylor",
        "fromId": 19891221,
        "fromHeadImg": "https://ae01.alicdn.com/kf/H94c78935ffa64e7e977544d19ecebf06L.jpg",
        "to": "Lan",
        "toId": 19870621,
        "comment": "Wow, that’s such high praise coming from an Italian! I’ve always loved their gelato, but now I have even more reason to appreciate it. Pistachio is on my list!",
        "time": "15/10/2024 8:43",
        "commentNum": 1,
        "like": 15,
        "inputShow": false
      },
      {
        "from": "AJ",
        "fromId": 1123,
        "fromHeadImg": "https://ae01.alicdn.com/kf/Hf6c0b4a7428b4edf866a9fbab75568e6U.jpg",
        "to": "Lan",
        "toId": 19870621,
        "comment": "I’ve never been to Italy, but hearing that the pistachio flavor is that authentic makes me want to try it even more! I’ll definitely order it on my next visit.",
        "time": "215/10/2024 18:43",
        "commentNum": 0,
        "like": 5,
        "inputShow": false
      }
    ]
  },
  {
    "name": "Scott",
    "id": 19891221,
    "headImg": "https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/04a98af8-20b6-43e3-9057-68eee0bf3af0/b928f408-091c-4560-ab60-e34f79b6351a.png",
    "comment": "I’ve lived in Brisbane my whole life, and Messina Gelato is hands down the best gelato in the city! The flavors are always fresh and unique, and I love trying their new specials every time I visit. My personal favorite has to be the salted caramel with white chocolate—it’s absolutely addictive. If you’re a local and haven’t been yet, you’re seriously missing out!",
    "time": "03/10/2024 18:43",
    "commentNum": 1,
    "like": 5,
    "inputShow": false,
    "reply": [
      {
        "from": "Laos",
        "fromId": 19870621,
        "fromHeadImg": "https://ae01.alicdn.com/kf/Hd60a3f7c06fd47ae85624badd32ce54dv.jpg",
        "to": "Scott",
        "toId": 19891221,
        "comment": "I’m a regular at Messina too! Totally agree about the salted caramel—it’s the perfect mix of sweet and salty. Have you tried their coconut and lychee flavor? It’s amazing!",
        "time": "11/10/2024 18:43",
        "commentNum": 25,
        "like": 5,
        "inputShow": false
      }
    ]
  },
  {
    "name": "Rockwell",
    "id": 20190830,
    "headImg": "https://t4.ftcdn.net/jpg/04/33/17/97/360_F_433179700_htTCGwPpXrTwwuLImhJaX4puNBhs44Vc.jpg",
    "comment": "I’m originally from Florence, and finding gelato that tastes like it does back home is hard. But Messina absolutely nailed it. Their hazelnut flavor is just like the gelato I grew up with. Every time I visit, it feels like I’m taking a little trip back to Italy. Highly recommended!",
    "time": "10/10/2024 18:43",
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