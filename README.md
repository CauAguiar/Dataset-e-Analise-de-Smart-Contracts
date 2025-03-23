# Análise Comparativa de IA Generativa em Segurança de Blockchain

Repositório oficial do artigo **"Análise comparativa de IA generativa em segurança de blockchain: avaliando modelos de linguagem de grande escala na detecção de vulnerabilidades de contratos inteligentes"** submetido ao CSBC 2025.

## 📜 Contexto Acadêmico
**Autores:**  
Lis Loureiro Sousa, Cauê R. de Aguiar, Ademir de J. Reis Júnior,  
Breno N. Couto, Ângela G. de Souza Silva, Caio F. Porto  
**Orientador:** Prof. Dr. Hélio Lopes dos Santos  
**Instituição:** Universidade Estadual do Sudoeste da Bahia (UESB)

**Status do Artigo:**  
✅ Submetido - CSBC 2025  
📅 Em avaliação

## 🎯 Objetivo
Avaliar a eficácia de 4 LLMs de última geração (GPT-4o, DeepSeek-R1, Llama 3.3 e Gemini 2.0 Flash) na detecção automática de vulnerabilidades em contratos inteligentes, comparando seu desempenho com auditorias humanas especializadas.

## 📋 Metodologia
1. **Base Experimental:**  
   - 40 contratos inteligentes estratificados (DeFi, NFTs, Governança e Contratos Limpos)
   - Dados públicos de auditorias certificadas (preferencialmente 2022-2024)

2. **Pipeline de Análise:**  
   ```mermaid
   graph LR
   A[Contratos] --> B[Extração Ground Truth]
   A --> C[Auditoria por LLMs]
   B --> D[Avaliação Comparativa]
   C --> D
   D --> E[Métricas de Desempenho]

3. **Métricas Principais:**  
   - Precisão, Recall, F1-Score
   - Taxa de Falsos Negativos
   - Erro Médio Absoluto (EMA)
   - Latência Média

## 🔍 Resultados 
| Modelo            | Precisão | Recall | F1-Score | Taxa FN  | Erro Médio Absoluto | Latência Média
|-------------------|----------|--------|----------|----------|---------------------|-------------------|
| DeepSeek-R1       | 10.36%   | 22.48% | 14.18%   | 77.52%   | 0.86                | 80.76s            |
| GPT-4o            | 8.71%    | 22.48% | 12.55%   | 77.52%   | 1.17                | 15.75s            |
| Gemini 2.0 Flash  | 7.14%    | 11.63% | 8.85%    | 88.37%   | 0.67                | 12.57s            |
| Llama 3.3         | 6.21%    | 20.93% | 9.57%    | 79.07%   | 1.07                | 15.98s            |