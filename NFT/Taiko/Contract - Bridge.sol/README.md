# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `Bridge`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Descrição                                                                                             | Severidade           |
|-----|-------------------------------------------------------------------------------------------------------|----------------------|
| V01 | Chamada de dados arbitrários não verificados permite que atacantes contornem validações e passem hashes de mensagens maliciosas diretamente para o serviço de sinal | High severity        |
| V02 | Função `processMessage` permite que qualquer um execute transações no bridge, podendo invocar funções arbitrárias, como `transferFrom` para roubo de aprovações | Low severity         |
| V03 | Possibilidade de executar transações em contratos internos do protocolo usando a função `processMessage` | Low severity         |
| V04 | Erros e eventos não utilizados precisam ser removidos                                                    | Informational findings|
| V05 | Substituir `assert` por `require` em funções como `transferFrom()` e `_mint()`                          | Informational findings|
| V06 | Comentário no contrato Bridge (L226-227) está enganoso. A lógica implementada não corresponde à descrição no comentário sobre o uso do limite de gás | Informational findings|
| V07 | Tamanho dos gaps não configurados de maneira uniforme nos contratos (`__gap` variável)                  | Informational findings|
---

### Análise por LLM

#### GPT-4o

| ID  | Descrição                                                                                             | Severidade Detectada  | Correta? | Tipo (VP/FP/FN) |
|-----|-------------------------------------------------------------------------------------------------------|---------------------|----------|-----------------|
| V01 | Chamada de dados arbitrários não verificados permite que atacantes contornem validações e passem hashes de mensagens maliciosas diretamente para o serviço de sinal | -                   | ❌       | FN              |
| V02 | Função `processMessage` permite que qualquer um execute transações no bridge, podendo invocar funções arbitrárias, como `transferFrom` para roubo de aprovações | -                   | ❌       | FN              |
| V03 | Possibilidade de executar transações em contratos internos do protocolo usando a função `processMessage` | -                   | ❌       | FN              |
| V04 | Erros e eventos não utilizados precisam ser removidos                                                    | -                   | ❌       | FN              |
| V05 | Substituir `assert` por `require` em funções como `transferFrom()` e `_mint()`                          | -                   | ❌       | FN              |
| V06 | Comentário no contrato Bridge (L226-227) está enganoso. A lógica implementada não corresponde à descrição no comentário sobre o uso do limite de gás | -                   | ❌       | FN              |
| V07 | Tamanho dos gaps não configurados de maneira uniforme nos contratos (`__gap` variável)                  | -                   | ❌       | FN              |
| -   | Reentrancy Attack Risk | High severity        | ❌       | FP              |
| -   | Access Control Issues | High severity        | ❌       | FP              |
| -   | Incorrect Initialization | High severity        | ❌       | FP              |
| -   | Gas Limit Handling Issues | High severity        | ❌       | FP              |
| -   | Lack of Rate-Limiting | High severity        | ❌       | FP              |
| -   | Untrusted External Calls | Medium severity      | ❌       | FP              |
| -   | Insufficient Validation of `message.destChainId` | Medium severity      | ❌       | FP              |
| -   | Unverified Merkle Proofs | Medium severity      | ❌       | FP              |
| -   | Lack of Event Emission for Critical Actions | Low severity        | ❌       | FP              |
| -   | Unnecessary `assert` Statement | Low severity        | ❌       | FP              |
| -   | Potential Front-Running Risks | Low severity        | ❌       | FP              |
| -   | Improper Commenting | Informational        | ❌       | FP              |
| -   | Use of Magic Constants | Informational        | ❌       | FP              |
| -   | Redundant Checks | Informational        | ❌       | FP              |
| -   | Lack of Full Specification for External Calls | Undetermined        | ❌       | FP              |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 15 (FP)                 |
| **Não Detectado** | 7 (FN)         | 0 (VN)                 |

#### DeepSeek-R1


| ID  | Descrição                                                                                             | Severidade Detectada  | Correta? | Tipo (VP/FP/FN) |
|-----|-------------------------------------------------------------------------------------------------------|---------------------|----------|-----------------|
| V01 | Chamada de dados arbitrários não verificados permite que atacantes contornem validações e passem hashes de mensagens maliciosas diretamente para o serviço de sinal | High severity            | ✅       | VP |
| V02 | Função `processMessage` permite que qualquer um execute transações no bridge, podendo invocar funções arbitrárias, como `transferFrom` para roubo de aprovações | Informational             | ✅       | VP (severidade incorreta) |
| V03 | Possibilidade de executar transações em contratos internos do protocolo usando a função `processMessage` | -                   | ❌       | FN |
| V04 | Erros e eventos não utilizados precisam ser removidos                                                    | -                   | ❌       | FN |
| V05 | Substituir `assert` por `require` em funções como `transferFrom()` e `_mint()`                          | -                   | ❌       | FN |
| V06 | Comentário no contrato Bridge (L226-227) está enganoso. A lógica implementada não corresponde à descrição no comentário sobre o uso do limite de gás | -                   | ❌       | FN |
| V07 | Tamanho dos gaps não configurados de maneira uniforme nos contratos (`__gap` variável)                  | -                   | ❌       | FN |
| -   | Improper Initialization of Context | High severity        | ❌       | FP |
| -   | Unaccounted Ether Deposits | Medium severity      | ❌       | FP |
| -   | Insufficient Gas Griefing | Medium severity      | ❌       | FP |
| -   | Ether Refund Failures | Low severity        | ❌       | FP |
| -   | Inconsistent DestChain Validation | Low severity        | ❌       | FP |
| -   | Context Handling Without Initialization | Informational        | ❌       | FP |
| -   | External Signal Service Reliance | Undetermined        | ❌       | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 7 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V02                | Informational                | Low          | **1**    |  

#### Llama 3.3

| ID  | Descrição                                                                                             | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|-----|-------------------------------------------------------------------------------------------------------|--------------------------|----------|--------------------------|
| V01 | Reentrância                                                                                      | High severity            | ✅       | VP                      |
| V02 | Falha de Validação                                                                           | Low severity             | ✅       | VP |
| V03 | Execução arbitrária de transações no bridge                                            | Low severity             | ✅       | VP                      |
| V04 | Comentários desatualizados ou inconsistentes                                                      | Low severity             | ✅       | VP (severidade incorreta)|
| V05 | Uso de `assert` ao invés de `require`                                                               | -                        | ❌       | FN                      |
| V06 | Comentário enganoso no contrato Bridge (L226-227)                                                   | Low severity             | ✅       | VP (severidade incorreta)|
| V07 | Tamanho dos gaps não configurados de maneira uniforme                                              | -                        | ❌       | FN                      |
| -   | Uso de `tx.origin` pode permitir chamadas por contratos não confiáveis                           | High severity            | ❌       | FP                      |
| -   | Uso de `block.chainid` pode ser problemático em migrações de chain                                | High severity            | ❌       | FP                      |
| -   | Reutilização de salts em contratos pode permitir ataques preventivos                             | Medium severity          | ❌       | FP                      |
| -   | Uso inseguro de `call` pode resultar em perdas de Ether                                              | Medium severity          | ❌       | FP                      |
| -   | Conversões de tipo inadequadas podem levar a comportamentos inesperados                            | Medium severity          | ❌       | FP                      |
| -   | Interoperabilidade com outros contratos pode introduzir riscos                                      | Undetermined             | ❌       | FP                      |
| -   | Lógica de negócio pode conter vulnerabilidades específicas                                        | Undetermined             | ❌       | FP                      |
| -   | Uso de bibliotecas externas pode introduzir riscos se forem vulneráveis                            | Informational findings   | ❌       | FP                      |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 5 (VP)             | 8 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| V04                | Low                | Informational          | **1**    |  
| V06                | Low                | Informational          | **1**    |  


#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID  | Descrição                                                                                             | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|-----|-------------------------------------------------------------------------------------------------------|--------------------------|----------|----------------|
| V01 | Dependência da segurança do ISignalService                                                           | High severity            | ✅       | VP            |
| V02 | Falha de validação permitindo execução arbitrária                                                     | Low severity             | ✅       | VP            |
| V03 | Execução de transações em contratos internos                                                          | Low severity             | ✅       | VP            |
| V04 | Remoção de erros e eventos não utilizados                                                             | -                        | ❌       | FN            |
| V05 | Substituição de assert por require                                                                    | -                        | ❌       | FN            |
| V06 | Comentário enganoso no contrato Bridge                                                                | -                        | ❌       | FN            |
| V07 | Configuração inconsistente do tamanho dos gaps (__gap variável)                                       | -                        | ❌       | FN            |
| -   | Exposição potencial de informações de contexto (_ctx)                                                 | Low severity             | ❌       | FP            |
| -   | Risco de reentrância na callback do remetente                                                         | Medium severity          | ❌       | FP            |
| -   | Risco de reentrância no fallback do proprietário                                                      | Medium severity          | ❌       | FP            |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 3 (VP)             | 3 (FP)                 |
| **Não Detectado** | 4 (FN)         | 0 (VN)                 |

## Métricas Agregadas (Bridge.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 26.53 |
| **DeepSeek-R1** | 99.99 |
| **Llama 3.3** | 21.55 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 18.35 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 15 | 7 | 0 |
| **DeepSeek-R1** | 2 | 7 | 5 | 0 |
| **Llama 3.3** | 5 | 8 | 2 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 3 | 3 | 4 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 1 | 2 | 0.50 |
| **Llama 3.3** | 2 | 5 | 0.40 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 3 | 0.00 |

