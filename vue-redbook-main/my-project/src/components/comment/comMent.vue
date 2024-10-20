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
              placeholder="Leave your comment here..."
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
                  <div tabindex="0" contenteditable="true" spellcheck="false" placeholder="Leave Comment here..." @input="onDivInput($event)" class="reply-input reply-comment-input"></div>
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
                    name: 'Lana ',
                    id: 19870621,
                    headImg: 'data:image/jpeg;base64,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',
                    comment: 'This is such a beautiful place! I’ve always wanted to visit. Thanks for sharing! 👍',
                    time: '16/09/2024 18:43',
                    commentNum: 2,
                    like: 15,
                    inputShow: false,
                    reply: [
                        {
                            from: 'Sam123',
                            fromId: 19891221,
                            fromHeadImg: 'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-person-icon.png',
                            to: 'Lana ',
                            toId: 19870621,
                            comment: 'I agree! It looks absolutely stunning. Adding this to my travel list!！',
                            time: '16/09/2024 18:45',
                            commentNum: 1,
                            like: 15,
                            inputShow: false
                        },
                        {
                            from: 'Ariana',
                            fromId: 1123,
                            fromHeadImg: 'https://image.shutterstock.com/image-photo/cute-avatar-3d-image-girl-260nw-2393968093.jpg',
                            to: 'Lana ',
                            toId: 19870621,
                            comment: 'Same here! The photos are amazing, and the description makes it even more appealing',
                            time: '16/09/2024 18:46',
                            commentNum: 0,
                            like: 5,
                            inputShow: false
                        }
                    ]
                },
                {
                    name: 'Mr Rose',
                    id: 19891221,
                    headImg: 'https://cms.interiorcompany.com/wp-content/uploads/2024/01/red-velvet-types-of-red-roses.jpg',
                    comment: 'What an incredible view! Thanks for sharing this with us. I need to visit here one day!',
                    time: '16/09/2024 18:43',
                    commentNum: 1,
                    like: 5,
                    inputShow: false,
                    reply: [
                        {
                            from: 'Aussie',
                            fromId: 19870621,
                            fromHeadImg: 'https://ipa.org.au/wp-content/uploads/2024/01/29012024-australia-day-is-a-chance-for.jpg',
                            to: 'Mr Rose',
                            toId: 19891221,
                            comment: 'You won’t regret it! The views are even better in person.',
                            time: '16/09/2024 18:44',
                            commentNum: 25,
                            like: 5,
                            inputShow: false
                        }
                    ]
                },
                {
                    name: 'Norman ',
                    id: 20190830,
                    headImg: 'https://images.ctfassets.net/3nanhbfkr0pc/5hgTjj73NOYPg8GXQPH7U/7126399ba1769693692c06b84356ff13/Justin_Norman__1_.jpeg',
                    comment: 'Thanks for posting! This is such an inspiring place. Can’t wait to explore it myself.',
                    time: '01/10/2024 18:43',
                    commentNum: 0,
                    like: 5,
                    inputShow: false,
                    reply: []
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
                time: new Date().toLocaleString(), // 当前时间
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