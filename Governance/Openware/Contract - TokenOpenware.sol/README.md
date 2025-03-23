# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `TokenOpenware`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
| F-2023-1091 | Acesso Permissivo a Funções de Papel    | High severity |
| F-2023-1092 | Funções View Redundantes                | Low severity  |

---

### Análise por LLM

#### GPT-4o

| ID             | Descrição                                           | Severidade Detectada  | Correta? | Tipo (VP/FP/FN) |
|---------------|----------------------------------------------------|----------------------|----------|----------------|
| F-2023-1091  | Acesso Permissivo a Funções de Papel               | -      | ❌       | FN  |
| F-2023-1092  | Funções View Redundantes                            | -         | ❌       | FN |
| -            | Blacklist Bypass via Approval & Allowance           | High severity       | ❌       | FP |
| -            | Blacklist Fund Burning Centralization Risk         | High severity       | ❌       | FP |
| -            | Delayed Activation Risk                             | Medium severity     | ❌       | FP |
| -            | Role-Based Access Risks                            | Medium severity     | ❌       | FP |
| -            | Lack of Event Emission for Role Changes            | Low severity        | ❌       | FP |
| -            | Hardcoded Decimal Override                         | Low severity        | ❌       | FP |
| -            | Lack of Explicit Reentrancy Protection             | Informational       | ❌       | FP |
| -            | Insufficient Documentation for Governance Transfer | Informational       | ❌       | FP |
| -            | Potential Compliance Issues with Blacklist Logic   | Undetermined        | ❌       | FP |

### **Matriz de Confusão**  

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|------------------|------------------------|
| **Detectado** | 0 (VP)           | 9 (FP)               |
| **Não Detectado** | 2 (FN)       | 0 (VN)               |

### **Não Houve Erro de Classificação**

#### DeepSeek-R.1

| ID            | Descrição                                    | Severidade Detectada      | Correta? | Tipo (VP/FP/FN)              |
|--------------|--------------------------------|--------------------------|----------|--------------------------|
| F-2023-1091 | Acesso Permissivo a Funções de Papel | Não detectado            | ❌       | FN                       |
| F-2023-1092 | Funções View Redundantes         | Não detectado            | ❌       | FN                       |
| -           | Centralized Initial Role Assignment | High severity            | ❌       | FP                       |
| -           | Unrestricted MINTER_ROLE Retention | High severity            | ❌       | FP                       |
| -           | Blacklisted Accounts Can Receive Tokens | High severity       | ❌       | FP                       |
| -           | Admin-Controlled Burning of Blacklisted Funds | Medium severity | ❌       | FP                       |
| -           | Premint Destination Risks | Medium severity         | ❌       | FP                       |
| -           | COMPLIANCE_ROLE Privilege Scope | Medium severity        | ❌       | FP                       |
| -           | Non-Standard Decimal Override | Low severity          | ❌       | FP                       |
| -           | Role-Based Blacklisting | Informational          | ❌       | FP                       |
| -           | OpenZeppelin Role Management Events | Informational      | ❌       | FP                       |
| -           | Post-Deployment Role Management | Undetermined         | ❌       | FP                       |

### **Matriz de Confusão:**  

|               | Vulnerável (Real) | Não Vulnerável (Real) |  
|---------------|--------------------|------------------------|  
| **Detectado** | 0 (VP)             | 10 (FP)                |  
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |  

### **Não Houve Erro de Classificação**

#### Llama 3.3

| ID               | Descrição                        | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)               |
|------------------|----------------------------------|--------------------------|----------|------------------------------|
| F-2023-1091      | Acesso Permissivo a Funções de Papel | -                        | ❌       | FN                           |
| F-2023-1092      | Funções View Redundantes         | -                        | ❌       | FN                           |
| -                | Reentrância                      | High severity            | ❌       | FP     |
| -                | Reentrância em Burn              | High severity            | ❌       | FP     |
| -                | Arbitragem                       | High severity            | ❌       | FP     |
| -                | Falta de Autenticação            | Medium severity          | ❌       | FP                           |
| -                | Permissões em Funções           | Medium severity          | ❌       | FP                           |
| -                | Falta de Validação de Inputs    | Medium severity          | ❌       | FP                           |
| -                | Utilização de Funções Obsoletas | Low severity             | ❌       | FP                           |
| -                | Falta de Documentação           | Low severity             | ❌       | FP                           |
| -                | Impacto da blacklist            | -                        | ❌       | FP                           |
| -                | Governo do token                | -                        | ❌       | FP                           |
| -                | Compliance com Padrões          | Informational            | ❌       | FP                           |
| -                | Segurança em Funções de Autenticação | Informational          | ❌       | FP                           |

**Matriz de Confusão:**

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 12 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**

### Gemini 2.0 Flash Thinking Experimental 01-21


| ID           | Descrição                             | Severidade Detectada     | Correta? | Tipo (VP/FP/FN)            |
|--------------|---------------------------------------|--------------------------|----------|---------------------------|
| F-2023-1091  | Acesso Permissivo a Funções de Papel | -            | ❌       | FN                        |
| F-2023-1092  | Funções View Redundantes             | -             | ❌       | FN                        |
| -            | Dependência de Timestamp para Ativação | Informational            | ❌       | FP                        |
| -            | Risco de Gestão Centralizada de Roles | Medium severity          | ❌       | FP                        |
| -            | Potencial de DoS via Blacklist para Usuários | Low severity             | ❌       | FP                        | 

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 3 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**

## Métricas Agregadas (TokenOpenware.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 13.79 |
| **DeepSeek-R1** | 111.86 |
| **Llama 3.3** | 33.97 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 10.28 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 9 | 2 | 0 |
| **DeepSeek-R1** | 0 | 10 | 2 | 0 |
| **Llama 3.3** | 0 | 12 | 2 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 3 | 2 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

