const form = document.getElementById("chat-form");
const input = document.getElementById("chat-input");
const messages = document.getElementById("chat-messages");
const apiKey = "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";

form.addEventListener("submit", async (e) => {
  e.preventDefault();
  const message = input.value;
  input.value = "";

  messages.innerHTML += `<div class="message user-message">
  <img src="C:\Users\mateeb.ce41ceme\Desktop\radixgpt_UI\icons\me.png" alt="user icon"> <span>${message}</span>
  </div>`;
  if (!document.getElementById("chat-messages")) {
    console.error("Element with ID 'chat-messages' not found in the HTML document");
  }
  
  // Use axios library to make a POST request to the OpenAI API
  const response = await axios.post(
    "https://api.openai.com/v1/completions",
    {
      prompt: message,
      model: "text-davinci-003",
      temperature: 10,
      max_tokens: 1000,
    },
    {
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${apiKey}`,
      },
    }
  );
  const chatbotResponse = response.data.choices[0].text;

  messages.innerHTML += `<div class="message bot-message">
  <img src="C:\Users\mateeb.ce41ceme\Desktop\radixgpt_UI\icons\chatbot.png" alt="bot icon"> <span>${chatbotResponse}</span>
  </div>`;
});