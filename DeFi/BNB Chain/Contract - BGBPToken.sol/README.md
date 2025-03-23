# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `BGBPToken`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID   | Descrição                                    | Severidade          |  
|------|--------------------------------------------|---------------------|  
| BGB-01 | Riscos de Centralização no BGBPToken       | Major               |  
| BGB-02 | Padrão Pull-Over-Push (Lógica)            | Minor               |  
| BGB-03 | Versão do Solidity não recomendada       | Informational       |  
| BGB-04 | Sombreamento de variável local           | Informational       |  
| BGB-05 | Componentes de código redundantes        | Informational       |  
| BGB-06 | Erros de digitação em comentários       | Informational       |  

#### GPT-4o

| ID      | Descricao                                                      | Severidade Detectada    | Correta? | Tipo (VP/FP/FN)              |
|---------|----------------------------------------------------------------|-------------------------|----------|------------------------------|
| BGB-01  | Riscos de Centralização no BGBPToken                          | -                       | ❌       | FN                           |
| BGB-02  | Padrão Pull-Over-Push (Lógica)                                | -                       | ❌       | FN                           |
| BGB-03  | Versão do Solidity não recomendada                            | Low                     | ✅       | VP (severidade incorreta)    |
| BGB-04  | Sombreamento de variável local                                | -                       | ❌       | FN                           |
| BGB-05  | Componentes de código redundantes                             | -                       | ❌       | FN                           |
| BGB-06  | Erros de digitação em comentários                             | -                       | ❌       | FN                           |
| -       | Possível Race Condition na Função `approve`                   | High                    | ❌       | FP                           |
| -       | Renúncia de Propriedade Irreversível (`renounceOwnership`)     | Medium                  | ❌       | FP                           |
| -       | Gestão de Pausadores sem Restrição de Remoção                 | Medium                  | ❌       | FP                           |
| -       | Funções de Transferência e Aprovação Não Protegidas por `whenNotPaused` | Undetermined             | ❌       | FP                           |
| -       | Eventos Não Emitidos em Algumas Funções Críticas               | Informational           | ❌       | FP                           |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 5 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| BGB-03            | Low                   | Informational          | **1**                   |

#### DeepSeek-R1

**Tabela LLM:**

| ID     | Descrição                                      | Severidade Detectada      | Correta? | Tipo (VP/FP/FN)                  |
|--------|----------------------------------|--------------------------|----------|---------------------------------|
| BGB-01 | Riscos de Centralização no BGBPToken | High severity            | ✅       | VP       |
| BGB-02 | Padrão Pull-Over-Push (Lógica)     | -                        | ❌       | FN                              |
| BGB-03 | Versão do Solidity não recomendada | -                        | ❌       | FN                              |
| BGB-04 | Sombreamento de variável local    | -                        | ❌       | FN                              |
| BGB-05 | Componentes de código redundantes | -                        | ❌       | FN                              |
| BGB-06 | Erros de digitação em comentários | -                        | ❌       | FN                              |
| -      | Reliance on Trusted Upgraded Contract | High severity       | ❌       | FP                              |
| -      | Insufficient Validation in Upgrade Mechanism | Medium severity | ❌       | FP                              |
| -      | Centralized Control Mechanisms    | Informational            | ❌       | FP                              |
| -      | Legacy Upgrade Pattern Dependency | Informational            | ❌       | FP                              |

**Matriz de Confusão:**

|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 4 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Não Houve Erro de Classificação**

#### Llama 3.3

| ID       | Descrição                                         | Severidade Detectada      | Correta? | Tipo (VP/FP/FN)                |
|----------|------------------------------------------------|--------------------------|----------|--------------------------------|
| BGB-01   | Riscos de Centralização no BGBPToken         | -                        | ❌       | FN                             |
| BGB-02   | Padrão Pull-Over-Push (Lógica)                | -                        | ❌       | FN                             |
| BGB-03   | Versão do Solidity não recomendada           | Low severity             | ✅       | VP (severidade incorreta)     |
| BGB-04   | Sombreamento de variável local                | -                        | ❌       | FN                             |
| BGB-05   | Componentes de código redundantes            | -                        | ❌       | FN                             |
| BGB-06   | Erros de digitação em comentários            | Informational             | ✅       | VP                             |
| -        | Reentrancy                                     | High severity            | ❌       | FP                             |
| -        | Front-Running                                  | High severity            | ❌       | FP                             |
| -        | Denial of Service (DoS)                        | Medium severity          | ❌       | FP                             |
| -        | Uso de Biblioteca Obsoleta                     | Medium severity          | ❌       | FP                             |
| -        | Função sem Proteção Adequada               | Medium severity          | ❌       | FP                             |
| -        | Exposição de Informação                     | Low severity             | ❌       | FP                             |
| -        | Comportamento Inesperado em `deprecate`        | Undetermined             | ❌       | FP                             |
| -        | Uso de Números Mágicos                         | Informational            | ❌       | FP                             |
| -        | Falta de Validação de Entrada                | Informational            | ❌       | FP                             |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 9 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| BGB-03                | Low              | Informational                   | **1**    |

### Gemini 2.0 Flash Thinking Experimental 01-21

| ID     | Descrição                                    | Severidade Detectada | Correta? | Tipo (VP/FP/FN)            |  
|--------|--------------------------------------------|----------------------|----------|----------------------------|  
| BGB-01 | Riscos de Centralização no BGBPToken      | -        | ❌       | FN                         |  
| BGB-02 | Padrão Pull-Over-Push (Lógica)            | -        | ❌       | FN                         |  
| BGB-03 | Versão do Solidity não recomendada       | -        | ❌       | FN                         |  
| BGB-04 | Sombreamento de variável local           | -        | ❌       | FN                         |  
| BGB-05 | Componentes de código redundantes        | -        | ❌       | FN                         |  
| BGB-06 | Erros de digitação em comentários        | -       | ❌       | FN                         |  
| -      | Reentrância                              | Medium severity      | ❌       | FP   |  
| -      | Falta de Validação de Entrada           | Low severity         | ❌       | FP   |  
| -      | Acesso não Autorizado                   | Medium severity      | ❌       | FP                         |  

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|------------------|----------------------|
| **Detectado** | 0 (VP)           | 3 (FP)               |
| **Não Detectado** | 6 (FN)       | 0 (VN)               |

**Não Houve Erro de Classificação**

## Métricas Agregadas (BGBPToken.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 8.56 |
| **DeepSeek-R1** | 102.13 |
| **Llama 3.3** | 20.78 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 10.84 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 5 | 5 | 0 |
| **DeepSeek-R1** | 1 | 4 | 5 | 0 |
| **Llama 3.3** | 2 | 9 | 4 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 3 | 6 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 1 | 1 | 1.00 |
| **DeepSeek-R1** | 0 | 1 | 0.00 |
| **Llama 3.3** | 1 | 2 | 0.50 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

