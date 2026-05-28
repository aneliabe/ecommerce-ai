# Ecommerce AI 🛍️🤖

A Ruby on Rails e-commerce platform featuring an AI-powered chatbot that answers customer questions based on the store's product catalog, using OpenAI API, vector embeddings, and Retrieval-Augmented Generation (RAG).

## 🔴 Live Demo
👉 [https://ecommerce-ai-htyn.onrender.com](https://ecommerce-ai-htyn.onrender.com)


Click **"Try Demo"** in the navbar to log in automatically — no signup needed.

## ✨ Features

- **AI Chatbot** — answers customer questions based on real product data using RAG and vector embeddings
- **Product catalog** — users can list and sell products
- **Payments** — Stripe integration for secure checkout
- **Authentication** — Devise-based user authentication
- **Real-time responses** — Turbo Streams for dynamic UI updates
- **Background jobs** — SolidQueue for async job processing

## 🤖 How the AI works

1. User sends a question via the chatbot
2. The question is converted into a vector embedding using OpenAI's `text-embedding-3-small` model
3. The embedding is compared against product embeddings stored in the database using euclidean distance
4. The most relevant products are retrieved and passed as context to GPT-4o-mini
5. The model generates a response based on the actual product catalog

## 🛠️ Tech Stack

- **Backend:** Ruby on Rails, PostgreSQL, SolidQueue
- **Frontend:** JavaScript, Stimulus.js, Turbo Streams, Bootstrap
- **AI:** OpenAI API, vector embeddings, RAG pipeline
- **Payments:** Stripe
- **Storage:** Cloudinary
- **Deploy:** Render

## ⚙️ Setup

```bash
git clone https://github.com/aneliabe/ecommerce-ai
cd ecommerce-ai
bundle install
rails db:create db:migrate db:seed
rails server
```

### Environment variables

Create a `.env` file with:
OPENAI_ACCESS_TOKEN=
STRIPE_PUBLISHABLE_KEY=
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET_KEY=
CLOUDINARY_URL=

## 📝 Notes

> The chatbot runs synchronously in the demo environment due to free tier limitations. In a production environment with a dedicated worker process, it would run fully asynchronously via SolidQueue.
