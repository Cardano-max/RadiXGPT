const chatHistory = document.querySelector(".chat-history");
const questionInput = document.querySelector("#question");
const submitQuestionButton = document.querySelector("#submit-question");
const endChatBtn = document.getElementById("endChatBtn");

// Retrieve the generated radiology report text from localStorage
const reportText = localStorage.getItem("generatedReport");

// Display the initial radiology report and prompt
appendToChatHistory("Radiology Report", reportText);
appendToChatHistory("Bot", "Please ask any questions you have about the radiology report.");

submitQuestionButton.addEventListener("click", async () => {
    const userQuestionText = questionInput.value.trim();
    if (userQuestionText.length === 0) return;

    // Display the user's question
    appendToChatHistory("User", userQuestionText);

    // Call the OpenAI API with the userQuestion and reportText
    const response = await fetch("/api/ask", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            question: userQuestionText,
            report: reportText
        })
    });

    if (response.ok) {
        const data = await response.json();

        // Display the response in the chat history
        appendToChatHistory("Bot", data.answer);
    } else {
        appendToChatHistory("Bot", "Sorry, I couldn't process your question. Please try again.");
    }

    questionInput.value = "";
});

endChatBtn.addEventListener("click", () => {
    appendToChatHistory("User", "Thank you");
    appendToChatHistory("Bot", "You're welcome! If you have any more questions, feel free to ask.");
});

function appendToChatHistory(sender, message) {
    const msgElement = document.createElement("div");
    msgElement.innerHTML = `<b>${sender}:</b> ${message}`;
    chatHistory.appendChild(msgElement);
    chatHistory.scrollTop = chatHistory.scrollHeight;
}
