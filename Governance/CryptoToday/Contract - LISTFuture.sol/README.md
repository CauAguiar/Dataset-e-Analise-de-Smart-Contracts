# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `LISTFuture`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID       | Descrição                               | Severidade    |
|----------|-----------------------------------------|---------------|
| V01   | Constructor overwhelmed. The code can fail if a list of token receivers is big enough. | Medium severity |

---
### GPT-4o

Aqui está a tabela preenchida com base na comparação entre a Auditoria Oficial e o arquivo Experimental:  

| ID   | Descrição                                         | Severidade Detectada | Correta? | Tipo (VP/FP/FN)           |
|------|-------------------------------------------------|----------------------|----------|--------------------------|
| V01  | Constructor overwhelmed. The code can fail if a list of token receivers is big enough. | - | ❌  | FN |
| -    | Lack of Access Control on burnFrom Function   | High severity        | ❌       | FP |
| -    | Missing Pausable Enforcement in Critical Functions | High severity   | ❌       | FP |
| -    | Unchecked Minting in Constructor              | Medium severity      | ❌       | FP |
| -    | Cap Enforcement Inconsistency                 | Medium severity      | ❌       | FP |
| -    | Lack of Event Emission in burnFrom            | Low severity         | ❌       | FP |
| -    | Misleading Contract Name and Comments         | Informational        | ❌       | FP |
| -    | Use of `unchecked` in burnFrom Without Clear Justification | Informational | ❌       | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 7 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
____________________________________________________________________________________________________________________________________________________________________
#### DeepSeek-R1

| ID   | Descrição                                          | Severidade Detectada     | Correta? | Tipo (VP/FP/FN) |
|------|--------------------------------------------------|--------------------------|----------|----------------|
| V01  | Constructor overwhelmed. The code can fail if a list of token receivers is big enough. | - | ❌  | FN   |
| -    | Falta de Controle de Tempo para Conversão        | High severity            | ❌      | FP             |
| -    | Validação Ausente de Endereços no Construtor     | Medium severity          | ❌      | FP             |
| -    | Funcionalidade de Pausa Incompleta              | Medium severity          | ❌       | FP              |
| -    | Uso Desnecessário de `unchecked` em `burnFrom`  | Low severity             | ❌       | FP              |
| -    | Falta de Eventos na Mintagem Inicial            | Informational            | ❌       | FP              |
| -    | Possível Falta de Integração com ERC20Burnable  | Undetermined             | ❌       | FP              |
 
**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 6 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
____________________________________________________________________________________________________________________________________________________________________

### Llama 3.3

| ID   | Descrição                                               | Severidade Detectada  | Correta? | Tipo (VP/FP/FN) |
|------|---------------------------------------------------------|-----------------------|----------|----------------|
| V01  | Constructor overwhelmed. The code can fail if a list of token receivers is big enough. |-| ❌ | FN |
| -    | Reentrância | High severity | ❌ | FP |
| -    | Controle de acesso insuficiente na função `burnFrom` | High severity | ❌ | FP |
| -    | Injeção de código devido ao uso de `unchecked` em `burnFrom` | Medium severity | ❌ | FP |
| -    | Falta de validação de entrada na função `burnFrom` | Medium severity | ❌ | FP |
| -    | Uso de versão de Solidity obsoleta | Low severity | ❌ | FP |
| -    | Falta de documentação | Low severity | ❌ | FP |
| -    | Uso de bibliotecas de terceiros | Undetermined | ❌ | FP |
| -    | Comportamento indefinido em caso de exceção | Undetermined | ❌ | FP |
| -    | Hardcode de valores | Informational | ❌ | FP |
| -    | Falta de testes | Informational | ❌ | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação

____________________________________________________________________________________________________________________________________________________________________

#### Gemini 2.0 Flash Thinking Experimental 01-21 

| ID   | Descrição                                               | Severidade Detectada  | Correta? | Tipo (VP/FP/FN) |
|------|---------------------------------------------------------|-----------------------|----------|----------------|
| V01  | Constructor overwhelmed. The code can fail if a list of token receivers is big enough. | - | ❌ | FN |
| -    | Falta de Controle de Acesso Específico na Função `burnFrom` | Medium severity | ❌ | FP |
| -    | Risco Potencial na Distribuição Inicial de Tokens no Construtor | Low severity | ❌ | FP |
| -    | Uso de `unchecked` na Subtração de `allowance` em `burnFrom` | Informational | ❌ | FP |
| -    | Dependência da Configuração Correta do `cap` no Construtor | Informational | ❌ | FP |
| -    | Dependência de Bibliotecas OpenZeppelin | Informational | ❌ | FP |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 5 (FP)                 |
| **Não Detectado** | 1 (FN)         | 0 (VN)                 |

**Erro de Classificação**
Não houve erros de classificação
____________________________________________________________________________________________________________________________________________________________________




## Métricas Agregadas (LISTFuture.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 25.79 |
| **DeepSeek-R1** | 47.53 |
| **Llama 3.3** | 25.46 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 13.18 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 0 | 7 | 1 | 0 |
| **DeepSeek-R1** | 0 | 6 | 1 | 0 |
| **Llama 3.3** | 0 | 10 | 1 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 5 | 1 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 0 | 0.00 |
| **DeepSeek-R1** | 0 | 0 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

