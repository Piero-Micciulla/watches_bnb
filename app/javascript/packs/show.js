const likingUnliking = () => {
  const liked = document.querySelector("#liked");
  const notLiked = document.querySelector("#not-liked");
  if (liked ){
  notLiked.addEventListener("click", (event) => {
    notLiked.classList.add("inactive");
    notLiked.classList.remove("active");
    liked.classList.add("active");
    liked.classList.remove("inactive");
  });

  liked.addEventListener("click", (event) => {
    notLiked.classList.add("active");
    notLiked.classList.remove("inactive");
    liked.classList.add("inactive");
    liked.classList.remove("active");
  });
}
}
export {likingUnliking};
